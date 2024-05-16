#!/bin/bash

# docker buildx create --name mybuilder
# docker buildx use mybuilder
# docker buildx inspect --bootstrap
docker buildx build \
    --push \
    --tag vimiix/gsql:latest \
    --tag vimiix/gsql:mogdb-5.0.6 \
    --platform=linux/arm64,linux/amd64 \
    .
