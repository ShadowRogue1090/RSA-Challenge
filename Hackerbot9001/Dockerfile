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

# packet capture permissions
RUN setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap || true

# capture directory
RUN mkdir -p /var/log/capture

# start capture + ssh
CMD bash -c "\
    tshark -i any -n \
        -f 'tcp port 2222 or tcp port 2224 or tcp port 9001' \
        -w /var/log/capture/capture.pcap & \
    sleep 1 && \
    /usr/sbin/sshd -D -e"