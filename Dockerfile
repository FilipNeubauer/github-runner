FROM myoung34/github-runner:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV RUNNER_TOOL_CACHE=/opt/hostedtoolcache
ENV AGENT_TOOLSDIRECTORY=/opt/hostedtoolcache

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
    zstd \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    && rm -rf /var/lib/apt/lists/*

# Tool cache directory for setup-node, setup-php, etc.
RUN mkdir -p /opt/hostedtoolcache && chmod -R 777 /opt/hostedtoolcache

# Allow the runner user to sudo without a password
RUN echo "runner ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/runner \
    && chmod 0440 /etc/sudoers.d/runner
