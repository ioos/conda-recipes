#!/usr/bin/env bash


REPO_ROOT=$(cd "$(dirname "$0")/.."; pwd;)
UPLOAD_OWNER="ioos"
IMAGE_NAME="ocefpaf/conda-recipes:latest_x64"

config=$(cat <<CONDARC

channels:
 - ${UPLOAD_OWNER}
 - defaults

show_channel_urls: True

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

conda install --yes obvious-ci=0.5.0 --channel conda-forge 

# A lock sometimes occurs with incomplete builds.
# The lock file is stored in build_artefacts.
conda clean --lock

python /conda-recipes/scripts/expand_source.py

conda install --yes anaconda-client
conda info

obvci_conda_build_dir /conda-recipes $UPLOAD_OWNER --build-condition "numpy >=1.9" "python >=2.7,<3|>=3.4"

EOF
