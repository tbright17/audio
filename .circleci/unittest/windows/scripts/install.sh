#!/usr/bin/env bash

unset PYTORCH_VERSION
# For unittest, nightly PyTorch is used as the following section,
# so no need to set PYTORCH_VERSION.
# In fact, keeping PYTORCH_VERSION forces us to hardcode PyTorch version in config.

set -e

eval "$(./conda/Scripts/conda.exe 'shell.bash' 'hook')"
conda activate ./env

printf "* Installing PyTorch nightly build"
conda install -y -c pytorch-nightly pytorch cpuonly

printf "* Installing torchaudio\n"
IS_CONDA=true python setup.py develop
