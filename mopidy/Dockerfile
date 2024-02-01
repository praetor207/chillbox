FROM ubuntu:latest

RUN mkdir -p /etc/apt/keyrings \
    && sudo wget -q -O /etc/apt/keyrings/mopidy-archive-keyring.gpg https://apt.mopidy.com/mopidy.gpg \
    && wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/bullseye.list

# Install Mopidy dependencies
RUN apt-get update && apt-get install -y \
    mopidy \
    mopidy-spotify \
    mopidy-soundcloud \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m -s /bin/bash mopidy
USER mopidy

# Set the default configuration file
ENV MOPIDY_CONFIG=/config/mopidy.conf

# Expose the Mopidy port
EXPOSE 6680

CMD ["mopidy"]

