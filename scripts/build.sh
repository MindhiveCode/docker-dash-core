#!/bin/bash
BUILD_PATH_TAG=${BUILD_PATH/\//-}

docker build -t "${IMAGE}:${BUILD_PATH_TAG}" ${BUILD_PATH}
