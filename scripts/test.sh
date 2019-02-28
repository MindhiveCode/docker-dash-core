#!/bin/bash
BUILD_PATH_TAG=${BUILD_PATH/\//-}

docker run "${IMAGE}:${BUILD_PATH_TAG}" --version | grep "Dash Core"
