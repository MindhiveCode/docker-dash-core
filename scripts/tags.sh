#!/bin/bash
BUILD_PATH_TAG=${BUILD_PATH/\//-}
BUILT_IMAGE=${IMAGE}:${BUILD_PATH_TAG}

if [[ "$BUILD_PATH" =~ "alpine" ]]
then
  docker tag "${BUILT_IMAGE}" "${IMAGE}:${VERSION}-alpine"
  if [[ ! "$BUILD_PATH" =~ "rc" ]]
  then
    docker tag "${BUILT_IMAGE}" "${IMAGE}:alpine"
    docker tag "${BUILT_IMAGE}" "${IMAGE}:latest"
  fi
else
  docker tag "${BUILT_IMAGE}" "${IMAGE}:${VERSION}"
fi
