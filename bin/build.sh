#!/bin/bash

set -ex

: "${IMAGE}"
: "${CREATED}"
: "${BUILD_URL}"
: "${TAG_VERSION_DATE}"

docker build -t "${IMAGE}" . \
  --label "org.opencontainers.image.created=${CREATED}" \
  --label "org.opencontainers.image.build-url=${BUILD_URL}" \
  --build-arg VERSION=${TAG_VERSION_SHA}
