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

# give capture permissions (important for tshark/dumpcap)
RUN setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap || true

# background packet capture (runs forever)
RUN mkdir -p /var/log/capture
CMD bash -c "\
    tshark -i eth0 -w /var/log/capture/capture.pcap & \
    /usr/sbin/sshd -D -e"