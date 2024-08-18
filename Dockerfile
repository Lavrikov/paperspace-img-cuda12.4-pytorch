# Используем образ на основе Ubuntu с поддержкой CUDA
FROM nvidia/cuda:12.4.1-cudnn8-devel-ubuntu22.04

# Установить зависимости для сборки Python
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libncurses5-dev \
    libsqlite3-dev \
    libreadline-dev \
    libffi-dev \
    libbz2-dev \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Загрузка и установка Python 3.11
RUN wget https://www.python.org/ftp/python/3.11.0/Python-3.11.0.tgz \
    && tar -xvf Python-3.11.0.tgz \
    && cd Python-3.11.0 \
    && ./configure --enable-optimizations \
    && make -j$(nproc) \
    && make altinstall \
    && cd .. \
    && rm -rf Python-3.11.0 Python-3.11.0.tgz

# Установка pip и JupyterLab
RUN python3.11 -m ensurepip --upgrade \
    && python3.11 -m pip install --no-cache-dir jupyterlab

# Expose порт 8888 для доступа к Jupyter Lab
EXPOSE 8888
