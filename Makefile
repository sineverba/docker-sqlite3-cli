IMAGE_NAME=sineverba/sqlite3-cli
CONTAINER_NAME=sqlite3-cli
VERSION=1.2.0-dev
ALPINE_VERSION=3.18.4
SQLITE_VERSION=3.41.2-r2

build:
	docker build \
		--no-cache \
		--build-arg ALPINE_VERSION=$(ALPINE_VERSION) \
		--build-arg SQLITE_VERSION=$(SQLITE_VERSION) \
		--tag $(IMAGE_NAME):$(VERSION) \
		"."

inspect:
	docker run \
		--rm \
		-it \
		--entrypoint /bin/sh \
		--name $(CONTAINER_NAME) \
		$(IMAGE_NAME):$(VERSION)

test:
	docker run --rm -it --entrypoint cat --name $(CONTAINER_NAME) $(IMAGE_NAME):$(VERSION) /etc/os-release | grep "Alpine Linux v3.18"
	docker run --rm -it --entrypoint cat --name $(CONTAINER_NAME) $(IMAGE_NAME):$(VERSION) /etc/os-release | grep "VERSION_ID=3.18.4"
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME):$(VERSION) sqlite3 --version | grep "3.41.2"

destroy:
	-docker image rm alpine:$(ALPINE_VERSION)
	-docker image rm $(IMAGE_NAME):$(VERSION)