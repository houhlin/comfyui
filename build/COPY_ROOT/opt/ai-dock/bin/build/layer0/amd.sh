#!/bin/bash

# Must exit and fail to build if any command fails
set -e

main() {
    install_comfyui
}

install_comfyui() {
    micromamba run -n comfyui ${PIP_INSTALL} \
            torch torchvision torchaudio "${PYTORCH_TAG}"
    /opt/ai-dock/bin/update-comfyui.sh
}

main "$@"; exit
