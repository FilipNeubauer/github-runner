FROM myoung34/github-runner:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
      sudo \
      software-properties-common \
      lsb-release \
      ca-certificates \
      curl \
      gnupg \
      git \
      unzip \
      zip \
      jq \
      build-essential \
    && rm -rf /var/lib/apt/lists/*

# Allow the runner user to sudo without a password (needed by setup-php and similar actions)
RUN echo "runner ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/runner \
    && chmod 0440 /etc/sudoers.d/runner