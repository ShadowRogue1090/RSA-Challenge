import socket

HOST = "0.0.0.0"
PORT = 8888

PUBLIC_KEY = """-----BEGIN PUBLIC KEY-----
BOBKEY123
-----END PUBLIC KEY-----
"""

CHALLENGE_HASH = "75e2f89beb5cd05949900c5978363ac5"
RESPONSE_HASH = "098f6bcd4621d373cade4e832627b4f6"


def handle_client(conn, addr):
    print(f"[+] Connection from {addr}")

    conn.sendall(b"Connected to Bob.\n")

    try:
        data = conn.recv(1024)
        if not data:
            return

        message = data.decode().strip()
        print(f"[>] Received: {message}")

        if message == "Requesting Public Key":
            conn.sendall(b"Sending public key...\n")
            conn.sendall(PUBLIC_KEY.encode() + b"\n")

        elif message == CHALLENGE_HASH:
            conn.sendall(b"Responce accepted.\n")
            conn.sendall(RESPONSE_HASH.encode() + b"\n")

        else:
            conn.sendall(b"Invalid request\n")

    except Exception as e:
        print(f"[!] Error: {e}")

    finally:
        conn.close()


def main():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        s.bind((HOST, PORT))
        s.listen()

        print(f"[*] Bob listening on {PORT}")

        while True:
            conn, addr = s.accept()
            handle_client(conn, addr)


if __name__ == "__main__":
    main()
