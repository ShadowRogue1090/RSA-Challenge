import socket
import threading
import os
from datetime import datetime

LISTEN_HOST = "0.0.0.0"
LISTEN_PORT = 8888

TARGET_HOST = "real-bob"
TARGET_PORT = 8888

LOG_FILE = "/home/hackerbot9001/logs/traffic.log"


os.makedirs(os.path.dirname(LOG_FILE), exist_ok=True)


def log(line):
    timestamp = datetime.utcnow().isoformat()
    with open(LOG_FILE, "a") as f:
        f.write(f"[{timestamp}] {line}\n")


def forward(src, dst, direction):
    while True:
        data = src.recv(4096)
        if not data:
            break

        text = data.decode(errors="ignore").strip()

        if text:
            log(f"{direction}: {text}")

        dst.sendall(data)


def handle_client(client):
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.connect((TARGET_HOST, TARGET_PORT))

    log("[+] connection opened")

    t1 = threading.Thread(target=forward, args=(client, server, "Alice->Bob"))
    t2 = threading.Thread(target=forward, args=(server, client, "Bob->Alice"))

    t1.start()
    t2.start()

    t1.join()
    t2.join()

    client.close()
    server.close()

    log("[-] connection closed")


def main():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind((LISTEN_HOST, LISTEN_PORT))
    s.listen()

    print("[*] Hackerbot listening on port 8888")

    while True:
        client, addr = s.accept()
        threading.Thread(target=handle_client, args=(client,)).start()


if __name__ == "__main__":
    main()
