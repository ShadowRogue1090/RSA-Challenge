import socket

HOST = "0.0.0.0"
PORT = 9001

PUBLIC_KEY = """-----BEGIN PUBLIC KEY-----
BOBKEY123
-----END PUBLIC KEY-----
"""

# Pre-determined challenge-response pair
CHALLENGE_HASH = "chall-hash"  # example: md5("hello")
RESPONSE_HASH = "098f6bcd4621d373cade4e832627b4f6"  # example: md5("test")


def handle_client(conn, addr):
    print(f"[+] Connection from {addr}")
    conn.sendall(b"Connected to Bob.\n")

    try:
        data = conn.recv(1024)
        if not data:
            return

        message = data.decode().strip()
        print(f"[>] Received: {message}")

        # --- Public Key Request ---
        if message == "Requesting Public Key":
            conn.sendall(b"Sending public key...\n")
            conn.sendall(PUBLIC_KEY.encode() + b"\n")

        # --- MD5 Challenge Response ---
        elif message == CHALLENGE_HASH:
            conn.sendall(b"Challenge accepted.\n")
            conn.sendall(RESPONSE_HASH.encode() + b"\n")

        else:
            conn.sendall(b"Invalid request\n")

    finally:
        conn.close()


def main():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind((HOST, PORT))
        s.listen()

        print(f"[*] Bob listening on {PORT}")

        while True:
            conn, addr = s.accept()
            handle_client(conn, addr)


if __name__ == "__main__":
    main()
