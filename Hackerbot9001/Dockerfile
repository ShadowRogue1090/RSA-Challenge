FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        openssh-server \
        tshark \
        termshark \
        socat \
        iproute2 \
        iptables \
        procps \
        && rm -rf /var/lib/apt/lists/*

# -------------------------
# User setup
# -------------------------
RUN useradd -m -s /bin/bash hackerbot9001 && \
    echo "hackerbot9001:hackerbot9001" | chpasswd

# -------------------------
# SSH setup
# -------------------------
RUN mkdir -p /run/sshd && \
    ssh-keygen -A

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo "AllowUsers hackerbot9001" >> /etc/ssh/sshd_config

# -------------------------
# Packet capture setup
# -------------------------
RUN mkdir -p /var/log/capture && \
    touch /var/log/capture/capture.pcap && \
    chmod 666 /var/log/capture/capture.pcap

RUN echo "alias termshark='termshark /var/log/capture/capture.pcap'" \
    >> /home/hackerbot9001/.bashrc

# -------------------------
# Network config
# -------------------------
ENV LISTEN_PORT=8888
ENV TARGET_HOST=Real_Bob
ENV TARGET_PORT=8888

# -------------------------
# Start MITM bridge
# -------------------------
CMD bash -c "\
    echo '[*] Starting hackerbot MITM bridge...' && \
    \
    sysctl -w net.ipv4.ip_forward=1 && \
    \
    # Resolve backend service reliably at runtime \
    TARGET_IP=$(getent hosts ${TARGET_HOST} | awk '{print $1}') && \
    echo '[*] Resolved Real_Bob to:' $TARGET_IP && \
    \
    # Start packet capture first \
    tshark -i any -n -f 'tcp port 8888' -w /var/log/capture/capture.pcap & \
    \
    # Start TCP relay (stable bidirectional proxy) \
    socat -d -d -v \
        TCP-LISTEN:${LISTEN_PORT},fork,reuseaddr \
        TCP:${TARGET_IP}:${TARGET_PORT} & \
    \
    # SSH for user access \
    exec /usr/sbin/sshd -D -e"