FROM nvidia/cuda:11.6.2-devel-ubuntu20.04

# Install base utilities
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y build-essential wget ninja-build unzip libgl-dev ffmpeg\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH

# set working directory
WORKDIR /workspace

# Copy the source code
COPY . /workspace

ENV TORCH_CUDA_ARCH_LIST="3.5;5.0;6.0;6.1;7.0;7.5;8.0;8.6+PTX"

RUN conda update -n base conda
RUN conda install -n base conda-libmamba-solver
RUN conda config --nset solver libmamba

# RUN conda env create -f environment.yml
# RUN conda init bash
# RUN ~/.bashrc
# RUN conda activate gaussian_splatting
# RUN conda install colmap