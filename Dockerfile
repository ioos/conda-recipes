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
                   file

RUN yum groupinstall -y 'Development Tools'

RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
RUN bash miniconda.sh -b -p /opt/conda && rm miniconda.sh
RUN /opt/conda/bin/conda update --yes --all
RUN /opt/conda/bin/conda config --add channels ioos --force
RUN /opt/conda/bin/conda install -c pelson/channel/development --yes obvious-ci --force

RUN PATH=/opt/conda/bin:$PATH obvci_install_conda_build_tools.py

ENV PATH /opt/conda/bin:$PATH
ENV LANG en_US.UTF-8

# Workaround until https://github.com/conda/conda-build/pull/731 makes into a
# release.
RUN ln -s /usr/bin/gunzip /usr/bin/uncompress
