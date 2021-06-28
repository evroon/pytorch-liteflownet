FROM cupy/cupy

ARG DEBIAN_FRONTEND=noninteractive

# Install basic packages
RUN apt-get update -y && apt-get upgrade -y && \
        apt-get install -y wget git libpython3-dev build-essential python-opencv && \
        apt-get autoremove -y && apt-get clean -y && apt-get autoclean -y

# Install python3 modules
RUN pip3 install --upgrade --no-cache-dir numpy matplotlib Pillow opencv-contrib-python

# Install pytorch
RUN pip3 install torch torchvision

WORKDIR /opt/pytorch-liteflownet
