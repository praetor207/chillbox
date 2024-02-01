FROM ubuntu:latest

# Install Mopidy dependencies
RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    wget && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /etc/apt/keyrings && \
    wget -q -O /etc/apt/keyrings/mopidy-archive-keyring.gpg https://apt.mopidy.com/mopidy.gpg && \
    wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/bullseye.list && \
    apt-get update && \
    apt-get install -y \
    mopidy \
    mopidy-soundcloud && \
    rm -rf /var/lib/apt/lists/*

# Set the default configuration file
ENV MOPIDY_CONFIG=/config/mopidy.conf

# Expose the Mopidy port
EXPOSE 6680

USER mopidy

CMD ["mopidy"]


