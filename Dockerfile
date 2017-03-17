# Polyscope Docker
FROM sschmittner/ubuntu_updated:latest

LABEL  version="0.0.1"
LABEL  description="OpenJPEG from source"

ENV  DEBIAN_FRONTEND noninteractive

MAINTAINER  Sebastian Schmittner (stp.schmittner@gmail.com)

RUN  apt-get install -y \
     git \
     autoconf \
     automake \
     libtool \
     pkg-config \
     cmake \
     liblcms2-dev \
     libtiff-dev \
     libpng-dev \
     libz-dev \
     libjpeg-dev \
     liblzma-dev \
     liblz-dev \
     zlib1g-dev
     
RUN mkdir -p /source/openjpeg && \
    cd /source/openjpeg && \
    git clone https://github.com/uclouvain/openjpeg.git . && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make
  
VOLUME ["/source/openjpeg"]


