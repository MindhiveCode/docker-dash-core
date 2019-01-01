REPOSITORY_NAME := jefethechefe/docker-dashd-nexus
IMAGE := ${REPOSITORY_NAME}:${VERSION}

build:
	docker build -t "${IMAGE}" ${BUILD_PATH}

test:
	docker run "${IMAGE}" --version | grep "Dash Core"

publish:
	docker push ${REPOSITORY_NAME}

.PHONY: force
