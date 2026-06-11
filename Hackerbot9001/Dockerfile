FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        openssh-server \
        tshark \
        termshark \
        iproute2 \
        procps \
        && rm -rf /var/lib/apt/lists/*

# user
RUN useradd -m -s /bin/bash hackerbot9001 && \
    echo "hackerbot9001:hackerbot9001" | chpasswd

# ssh runtime
RUN mkdir -p /run/sshd && \
    ssh-keygen -A

# restrict SSH access
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo "AllowUsers hackerbot9001" >> /etc/ssh/sshd_config

# packet capture permissions (dumpcap capability attempt)
RUN setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap || true

# capture directory + ensure user can read pcap
RUN mkdir -p /var/log/capture && \
    touch /var/log/capture/capture.pcap && \
    chmod 666 /var/log/capture/capture.pcap

# give user convenient termshark alias
RUN echo "alias termshark='termshark /var/log/capture/capture.pcap'" >> /home/hackerbot9001/.bashrc && \
    chown hackerbot9001:hackerbot9001 /home/hackerbot9001/.bashrc

# start capture + ssh
CMD bash -c "\
    echo '[*] Starting packet capture...' && \
    tshark -i any -n \
        -f 'tcp port 22 or tcp port 8888' \
        -w /var/log/capture/capture.pcap & \
    exec /usr/sbin/sshd -D -e"