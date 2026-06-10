FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y \
        openssh-server \
        netcat-openbsd \
        iproute2 \
        findutils \
        bat \
        nano \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash alice && \
    echo "alice:alice" | chpasswd

RUN mkdir /var/run/sshd

COPY challenge/ /home/alice/

RUN chown -R alice:alice /home/alice/challenge

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
