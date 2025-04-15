# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag 
# for a list of the most current containers we maintain
ARG BASE_CONTAINER=ghcr.io/ucsd-ets/scipy-ml-notebook:stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

#RUN apt-get -y install htop
RUN pip install --no-cache-dir networkx scipy

# 3) install packages using notebook user
USER jovyan

# Additional packages
# HW1 packages
RUN pip install \
    # Superpoint requirements \
    tensorboardX tensorflow-addons torchgeometry \
    coloredlogs \
    # Rest of the notebook in HW1
    pytorch-metric-learning faiss-cpu 

# HW2 packages
RUN conda install -y swig

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
