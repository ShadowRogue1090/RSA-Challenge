FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y \
        openssh-server \
        netcat-openbsd \
        iproute2 \
        findutils \
        bat \
        nano \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/batcat /usr/local/bin/bat

RUN useradd -m -s /bin/bash alice && \
    echo "alice:alice" | chpasswd

RUN mkdir /var/run/sshd

COPY alice-files/ /home/alice/

RUN chown -R alice:alice /home/alice

RUN find /home/alice -type f -name "*.sh" -exec chmod +x {} \;

RUN passwd -l root

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]