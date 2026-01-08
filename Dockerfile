FROM node:20-trixie-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
    tmux \
    ca-certificates \
    curl \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Prepare SSH (safe if already exists)
RUN mkdir -p /var/run/sshd

# Optional: non-root user
RUN useradd -m -s /bin/bash appuser

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
