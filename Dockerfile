# Use the official PyTorch image with CUDA 12.4 as the base image
FROM pytorch/manylinux-cuda124

# Set the working directory in the container
WORKDIR /workspace

# Install Jupyter Lab and any other dependencies you need
RUN pip install --no-cache-dir jupyterlab

# Expose port 8888 to be able to access Jupyter Lab
EXPOSE 8888
