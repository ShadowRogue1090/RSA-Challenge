import socket
import threading
import os
from scapy.all import wrpcap, Ether, IP, TCP, Raw

LISTEN_HOST = "0.0.0.0"
LISTEN_PORT = 8888

TARGET_HOST = "real-bob"
TARGET_PORT = 8888

PCAP_FILE = "/home/hackerbot9001/capture.pcap"

packets = []
lock = threading.Lock()

os.makedirs(os.path.dirname(PCAP_FILE), exist_ok=True)


def make_pkt(src_ip, dst_ip, payload):
    return Ether() / IP(src=src_ip, dst=dst_ip) / TCP() / Raw(load=payload)


def save(pkt):
    with lock:
        packets.append(pkt)
        wrpcap(PCAP_FILE, packets)


def pipe(src, dst, s_ip, d_ip):
    while True:
        data = src.recv(4096)
        if not data:
            break

        pkt = make_pkt(s_ip, d_ip, data)
        save(pkt)

        dst.sendall(data)


def handle(client):
    server = socket.socket()
    server.connect((TARGET_HOST, TARGET_PORT))

    t1 = threading.Thread(target=pipe, args=(client, server, "10.0.0.2", "10.0.0.3"))
    t2 = threading.Thread(target=pipe, args=(server, client, "10.0.0.3", "10.0.0.2"))

    t1.start()
    t2.start()

    t1.join()
    t2.join()


def main():
    s = socket.socket()
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind((LISTEN_HOST, LISTEN_PORT))
    s.listen()

    while True:
        c, _ = s.accept()
        threading.Thread(target=handle, args=(c,)).start()


if __name__ == "__main__":
    main()
