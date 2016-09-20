#!/usr/bin/env bash

if [ "${BINSTAR_TOKEN}" ]; then
  export UPLOAD="--upload-channels ioos"
else
  export UPLOAD=""
fi

REPO_ROOT=$(cd "$(dirname "$0")/.."; pwd;)
UPLOAD_OWNER="ioos"
IMAGE_NAME="pelson/obvious-ci:latest_x64"

config=$(cat <<CONDARC

channels:
 - ${UPLOAD_OWNER}
 - defaults

show_channel_urls: true

CONDARC
)

cat << EOF | docker run -i \
                        -v ${REPO_ROOT}:/conda-recipes \
                        -a stdin -a stdout -a stderr \
                        $IMAGE_NAME \
                        bash || exit $?

if [ "${BINSTAR_TOKEN}" ];then
    echo
    export BINSTAR_TOKEN=${BINSTAR_TOKEN}
fi

export CONDA_NPY='19'
export PYTHONUNBUFFERED=1
echo "$config" > ~/.condarc

conda update --yes conda
conda install --yes -c conda-forge obvious-ci conda-build-all
conda install --yes anaconda-client

# Workaournd https://github.com/conda/conda-build/issues/1491
conda install --yes conda-build=2.0.6

# A lock sometimes occurs with incomplete builds.
conda clean --lock

conda info

conda-build-all /conda-recipes/recipes $UPLOAD --inspect-channels $UPLOAD_OWNER --matrix-conditions "numpy >=1.11" "python >=2.7,<3|>=3.4"

EOF
