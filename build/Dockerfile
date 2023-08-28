# For build automation - Allows building from any ai-dock base image
# Use a *cuda*base* image as default because pytorch brings the libs
ENV PYTORCH_TAG=" --index-url https://download.pytorch.org/whl/rocm5.4.2"
ARG IMAGE_BASE="ghcr.io/ai-dock/pytorch:latest-rocm"
FROM ${IMAGE_BASE}

LABEL org.opencontainers.image.source https://github.com/ai-dock/comfyui

LABEL org.opencontainers.image.description "ComfyUI Stable Diffusion backend and GUI"

LABEL maintainer="Rob Ballantyne <rob@dynamedia.uk>"


# Copy early so we can use scripts in the build - Changes to these files will invalidate the cache and cause a rebuild.
COPY ./COPY_ROOT/ /

# Use build scripts to ensure we can build all targets from one Dockerfile in a single layer.
# Don't put anything heavy in here - We can use multi-stage building above if necessary.

ARG IMAGE_BASE
RUN bash -c /opt/ai-dock/bin/build/layer0/init.sh

ENV MAMBA_DEFAULT_ENV=comfyui

# Keep init.sh as-is and place additional logic in /opt/ai-dock/bin/preflight.sh
CMD ["init.sh"]
