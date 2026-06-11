FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        openssh-server \
        tcpdump \
        termshark \
        iproute2 \
        procps \
        && rm -rf /var/lib/apt/lists/*

# --------------------
# user setup
# --------------------
RUN useradd -m -s /bin/bash hackerbot9001 && \
    echo "hackerbot9001:hackerbot9001" | chpasswd

# --------------------
# ssh setup
# --------------------
RUN mkdir -p /run/sshd && \
    ssh-keygen -A

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo "AllowUsers hackerbot9001" >> /etc/ssh/sshd_config

# --------------------
# capture setup
# --------------------
RUN mkdir -p /var/log/capture && \
    touch /var/log/capture/capture.pcap && \
    chmod 666 /var/log/capture/capture.pcap

# make termshark easy
RUN echo "alias termshark='termshark /var/log/capture/capture.pcap'" \
    >> /home/hackerbot9001/.bashrc

# --------------------
# runtime
# --------------------
CMD bash -c "\
    echo '[*] Starting packet capture on eth0...' && \
    \
    # start capture (IMPORTANT: eth0, not any) \
    tcpdump -i eth0 tcp port 8888 -s 0 -w /var/log/capture/capture.pcap & \
    \
    # start ssh \
    exec /usr/sbin/sshd -D -e"