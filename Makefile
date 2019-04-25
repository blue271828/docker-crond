# -*- coding: utf-8 -*-

PJTDIR       := $(dir $(lastword $(MAKEFILE_LIST)))
DOCKER_IMAGE := crond


.PHONY: build test clean

build:
	@ docker build -t $(DOCKER_IMAGE) .

test:
	@ docker run --rm \
		-e GOSS_FILES_PATH=/goss \
		-e GOSS_FILES_STRATEGY=cp \
		-v $(realpath $(PJTDIR))/goss:/goss \
		-v /var/run/docker.sock:/var/run/docker.sock \
		kiwicom/dgoss /usr/local/bin/dgoss run $(DOCKER_IMAGE)

clean:
	$(eval CONTAINER_IDS = $(shell docker ps -aq -f ancestor=$(DOCKER_IMAGE)))
	$(eval IMAGE_IDS = $(shell docker images -aq -f reference=$(DOCKER_IMAGE)))
	@ [ -z "$(CONTAINER_IDS)" ] || docker rm $(CONTAINER_IDS)
	@ [ -z "$(IMAGE_IDS)" ] || docker rmi ${IMAGE_IDS}
