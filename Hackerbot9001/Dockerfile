FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        openssh-server \
        termshark \
        tcpdump \
        iproute2 \
        procps \
        && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash hackerbot9001 && \
    echo "hackerbot9001:hackerbot9001" | chpasswd

RUN mkdir -p /run/sshd && \
    ssh-keygen -A

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo "AllowUsers hackerbot9001" >> /etc/ssh/sshd_config

RUN mkdir -p /home/hackerbot9001/capture && \
    chown -R hackerbot9001:hackerbot9001 /home/hackerbot9001

CMD bash -c "\
    tcpdump -i eth0 tcp port 8888 -U -w /home/hackerbot9001/capture/capture.pcap & \
    exec /usr/sbin/sshd -D -e"