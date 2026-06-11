FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y \
        openssh-server \
        bat \
        termshark \
        wireshark-common \
        tcpdump \
    && rm -rf /var/lib/apt/lists/*

RUN pip install scapy

RUN useradd -m -s /bin/bash hackerbot9001 && \
    echo "hackerbot9001:hackerbot9001" | chpasswd

RUN mkdir -p /run/sshd

RUN mkdir -p /home/hackerbot9001 && \
    chown -R hackerbot9001:hackerbot9001 /home/hackerbot9001

COPY proxy.py /app/proxy.py

EXPOSE 8888 22

CMD bash -c "\
    python /app/proxy.py & \
    /usr/sbin/sshd -D -e"