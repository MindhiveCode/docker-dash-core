IMAGE := jefethechefe/docker-dashd-nexus

build:
	IMAGE=${IMAGE} ./scripts/build.sh

test:
	IMAGE=${IMAGE} ./scripts/test.sh

tags:
	IMAGE=${IMAGE} ./scripts/tags.sh

publish:
	docker push ${IMAGE}

.PHONY: force
