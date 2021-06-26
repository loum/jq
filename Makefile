.DEFAULT_GOAL := help

MAKESTER__REPO_NAME := loum
MAKESTER__PROJECT_NAME := jq
ALPINE_DOCKER_VERSION := 20210212
JQ_VERSION := 1.6-r1
MAKESTER__IMAGE_TARGET_TAG := alpine${ALPINE_DOCKER_VERSION}-${JQ_VERSION}
MAKESTER__VERSION := $(MAKESTER__IMAGE_TARGET_TAG)

include makester/makefiles/makester.mk
include makester/makefiles/docker.mk

MAKESTER__CONTAINER_NAME := jq
MAKESTER__BUILD_COMMAND = $(DOCKER) build\
 --no-cache\
 --build-arg ALPINE_DOCKER_VERSION=$(ALPINE_DOCKER_VERSION)\
 --build-arg JQ_VERSION=$(JQ_VERSION)\
 -t $(MAKESTER__SERVICE_NAME):$(MAKESTER__IMAGE_TARGET_TAG) .

docker-login:
	-@$(DOCKER) login $(MAKESTER__REPO_NAME)

MAKESTER__RUN_COMMAND := $(DOCKER) run --rm -ti\
 --name $(MAKESTER__CONTAINER_NAME)\
 $(MAKESTER__SERVICE_NAME):$(MAKESTER__IMAGE_TARGET_TAG)

help: makester-help docker-help
	@echo "(Makefile)\n\
  docker-login         Log into Docker container registry "$(MAKESTER__REPO_NAME)"\n"

.PHONY: help
