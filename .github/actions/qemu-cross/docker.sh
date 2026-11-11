#!/bin/bash
set -e

docker run --rm \
    --platform ${PLATFORM_NAME} \
    --dns 8.8.8.8 --dns 1.1.1.1 \
    --name qemu-cross-${PLATFORM_NAME} \
    --mount type=bind,source=${HOST_WORKSPACE_DIR},target=/github_workspace \
    --workdir /github_workspace \
    ${PLATFORM_NAME}/eclipse-temurin:11-jdk-focal ./.github/actions/qemu-cross/build.sh
