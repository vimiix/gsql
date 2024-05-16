#!/bin/bash
#
# Author: Vimiix <i@vimiix.com>
#
# Usage: ./release.sh <DockerfilePath> <tag>
#

set -e

if [ $# -lt 2 ]; then
    echo "Usage: ./release.sh <DockerfilePath> <tag>"
    exit 1
fi

DOCKERFILE=$1
TAG=$2

# docker buildx create --name mybuilder
# docker buildx use mybuilder
# docker buildx inspect --bootstrap
docker buildx build \
    --push \
    --tag "$TAG" \
    --platform=linux/arm64,linux/amd64 \
    -f "$DOCKERFILE" .
