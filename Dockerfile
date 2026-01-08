FROM node:20-trixie-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install SSH server + tmux + basic utils
RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
    tmux \
    ca-certificates \
    curl \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Prepare SSH
RUN mkdir /var/run/sshd

# Optional: non-root user
RUN useradd -m -s /bin/bash appuser

# Allow SSH
EXPOSE 22

# Keep container running
CMD ["/usr/sbin/sshd", "-D"]
