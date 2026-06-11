FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        openssh-server \
        tshark \
        tcpdump \
        termshark \
        iproute2 \
        procps \
        && rm -rf /var/lib/apt/lists/*

# user
RUN useradd -m -s /bin/bash hackerbot9001 && \
    echo "hackerbot9001:hackerbot9001" | chpasswd

# ssh setup
RUN mkdir -p /run/sshd && \
    ssh-keygen -A

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo "AllowUsers hackerbot9001" >> /etc/ssh/sshd_config

# capture storage
RUN mkdir -p /var/log/capture && \
    chmod 777 /var/log/capture

# convenience alias
RUN echo "alias termshark='termshark /var/log/capture/capture.pcap'" >> /home/hackerbot9001/.bashrc

# run passive capture only
CMD bash -c "\
    echo '[*] Starting passive sniffing on port 8888...' && \
    tcpdump -i any tcp port 8888 -s 0 -w /var/log/capture/capture.pcap & \
    exec /usr/sbin/sshd -D -e"