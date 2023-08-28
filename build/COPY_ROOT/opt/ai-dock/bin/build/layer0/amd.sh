#!/bin/bash

# Must exit and fail to build if any command fails
set -e

main() {
    install_comfyui
}

install_comfyui() {
    micromamba run -n comfyui ${PIP_INSTALL} \
            --no-cache-dir \
            --index-url https://download.pytorch.org/whl/rocm${ROCM_VERSION} \
            torch==${PYTORCH_VERSION} torchvision torchaudio
    /opt/ai-dock/bin/update-comfyui.sh
}

main "$@"; exit
