IMAGE := jefethechefe/docker-dashd-nexus

build:
	IMAGE=${IMAGE} bash scripts/build.sh

test:
	IMAGE=${IMAGE} bash scripts/test.sh

tags:
	IMAGE=${IMAGE} bash scripts/tags.sh

publish:
	docker push ${IMAGE}

.PHONY: force
