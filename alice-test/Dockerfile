FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y \
        openssh-server \
        netcat-openbsd \
        vim-tiny \
        less \
        procps \
        iproute2 \
        findutils \
        && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash alice && \
    echo "alice:alice" | chpasswd

RUN mkdir /var/run/sshd

COPY challenge/ /home/alice/challenge/

RUN chown -R alice:alice /home/alice/challenge

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
