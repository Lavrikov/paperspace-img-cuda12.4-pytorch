# Use the official PyTorch image with CUDA 12.4 as the base image
FROM pytorch/manylinux-cuda124

# install python3.11
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update && apt-get install -y \
    python3.11 python3.11-venv python3.11-dev python3-pip \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /workspace

# Install Jupyter Lab and any other dependencies you need
RUN pip install --no-cache-dir jupyterlab

# Expose port 8888 to be able to access Jupyter Lab
EXPOSE 8888
