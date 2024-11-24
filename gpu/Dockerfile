# Start from NVIDIA's CUDA base image with development tools
FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04

# Set environment variables
ENV PYTHON_VERSION=3.11
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
ENV PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64:/usr/local/cuda/lib64:${LD_LIBRARY_PATH}
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update && apt-get install -y --no-install-recommends \
    python${PYTHON_VERSION} \
    python${PYTHON_VERSION}-dev \
    python3-pip \
    python3-wheel \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Create symbolic links for python
RUN ln -s /usr/bin/python${PYTHON_VERSION} /usr/local/bin/python \
    && ln -s /usr/bin/python${PYTHON_VERSION} /usr/local/bin/python3

# Install TensorFlow dependencies
RUN python -m pip install --no-cache-dir --upgrade pip setuptools

# Install TensorFlow with GPU support
RUN pip install --no-cache-dir \
    tensorflow==2.15.0 \
    nvidia-cublas-cu12==12.2.* \
    nvidia-cudnn-cu12==8.9.* \
    nvidia-cufft-cu12==11.0.* \
    nvidia-curand-cu12==10.3.* \
    nvidia-cusolver-cu12==11.5.* \
    nvidia-cusparse-cu12==12.1.* \
    nvidia-nccl-cu12==2.18.* \
    tensorflow-datasets

# Set working directory
WORKDIR /app

# Verification script
COPY <<EOF /app/verify_gpu.py
import tensorflow as tf
print("TensorFlow version:", tf.__version__)
print("Num GPUs Available:", len(tf.config.list_physical_devices('GPU')))
print("GPU Devices:", tf.config.list_physical_devices('GPU'))
EOF

CMD ["python"]