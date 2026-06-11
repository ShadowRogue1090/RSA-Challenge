FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        openssh-server \
        tshark \
        termshark \
        iproute2 \
        iptables \
        procps \
        && rm -rf /var/lib/apt/lists/*

# user
RUN useradd -m -s /bin/bash hackerbot9001 && \
    echo "hackerbot9001:hackerbot9001" | chpasswd

# ssh
RUN mkdir -p /run/sshd && \
    ssh-keygen -A

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo "AllowUsers hackerbot9001" >> /etc/ssh/sshd_config

# capture setup
RUN mkdir -p /var/log/capture && \
    touch /var/log/capture/capture.pcap && \
    chmod 666 /var/log/capture/capture.pcap

RUN echo "alias termshark='termshark /var/log/capture/capture.pcap'" >> /home/hackerbot9001/.bashrc

# enable forwarding
RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

# start everything
CMD bash -c "\
    echo '[*] Starting MITM NAT + capture...' && \
    sysctl -w net.ipv4.ip_forward=1 && \
    \
    # NAT redirect bob:8888 → Real_Bob:8888 \
    iptables -t nat -A PREROUTING -p tcp --dport 8888 -j DNAT --to-destination Real_Bob:8888 && \
    iptables -t nat -A POSTROUTING -j MASQUERADE && \
    \
    # capture traffic \
    tshark -i any -n -f 'tcp port 8888' -w /var/log/capture/capture.pcap & \
    \
    exec /usr/sbin/sshd -D -e"