FROM node:20-trixie-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    tmux \
    ca-certificates \
    curl \
    procps \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Optional user
RUN useradd -m -s /bin/bash appuser

WORKDIR /workspace

# Keep container alive
CMD ["sleep", "infinity"]
