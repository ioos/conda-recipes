FROM centos:6

MAINTAINER Filipe Fernandes <ocefpaf@gmail.com>

RUN yum -y update && yum clean all

# Build tools.
RUN yum install -y bzip2 \
                   gcc-c++ \
                   git \
                   make \
                   patch \
                   tar \
                   which \
                   libXext \
                   libXrender \
                   libSM \
                   libX11-devel \
                   file \
                   wget

RUN yum groupinstall -y 'Development Tools'

RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
RUN bash miniconda.sh -b -p /opt/conda && rm miniconda.sh
RUN /opt/conda/bin/conda update --yes --all
RUN /opt/conda/bin/conda config --add channels ioos --force

ENV PATH /opt/conda/bin:$PATH
ENV LANG en_US.UTF-8
