FROM rocm/pytorch:latest

# Install ffmpeg
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    sudo \
    python3-distutils \
    ffmpeg

# Install whisper
RUN pip install --upgrade pip

RUN pip install git+https://github.com/openai/whisper.git

# Create the wrapper script
RUN echo '#!/bin/bash\nwhisper --device cuda "$@"' > /usr/local/bin/whisper-rocm && \
    chmod +x /usr/local/bin/whisper-rocm

VOLUME /data

VOLUME /root/.cache/whisper

WORKDIR /data