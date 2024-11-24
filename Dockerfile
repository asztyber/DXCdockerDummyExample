# Use NVIDIA CUDA base image
FROM nvidia/12.6.2-cudnn-runtime-ubuntu24.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    curl \
    build-essential \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Install Python and TensorFlow
RUN apt-get update && apt-get install -y python3.8 python3.8-venv python3-pip \
    && python3 -m pip install --upgrade pip \
    && pip install tensorflow


# Create a symlink for `python` if not present
RUN ln -s /usr/bin/python3 /usr/bin/python

# ******* end of alternative for GPU *********

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . .

# Install any Python dependencies (each participant can provide their own requirements.txt)
RUN pip install --no-cache-dir -r requirements.txt

# Set the entry point to Python
ENTRYPOINT ["python"]
