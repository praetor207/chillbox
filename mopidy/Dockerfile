FROM python:3-slim

# Install Mopidy dependencies
RUN apt-get update && apt-get install -y \
    mopidy \
    mopidy-spotify \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m -s /bin/bash mopidy
USER mopidy

# Set the default configuration file
ENV MOPIDY_CONFIG=/config/mopidy.conf

# Expose the Mopidy port
EXPOSE 6680

CMD ["mopidy"]

