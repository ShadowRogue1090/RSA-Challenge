FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y openssh-server && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash hackerbot9001 && \
    echo "hackerbot9001:hackerbot9001" | chpasswd

RUN mkdir -p /run/sshd

COPY proxy.py /app/proxy.py

RUN mkdir -p /home/hackerbot9001/logs && \
    chown -R hackerbot9001:hackerbot9001 /home/hackerbot9001

EXPOSE 8888 22

CMD bash -c "\
    python /app/proxy.py & \
    /usr/sbin/sshd -D -e"