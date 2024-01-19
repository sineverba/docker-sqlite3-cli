IMAGE_NAME=sineverba/sqlite3-cli
CONTAINER_NAME=sqlite3-cli
APP_VERSION=1.2.0-dev
ALPINE_VERSION=3.19.0
SQLITE_VERSION=3.44.2-r0

build:
	docker build \
		--no-cache \
		--build-arg ALPINE_VERSION=$(ALPINE_VERSION) \
		--build-arg SQLITE_VERSION=$(SQLITE_VERSION) \
		--tag $(IMAGE_NAME):$(APP_VERSION) \
		"."

inspect:
	docker run \
		--rm \
		-it \
		--entrypoint /bin/sh \
		--name $(CONTAINER_NAME) \
		$(IMAGE_NAME):$(APP_VERSION)

upgrade:
	docker run \
		--rm \
		-it \
		--entrypoint /bin/sh \
		--name $(CONTAINER_NAME)-upgrade \
		alpine:$(ALPINE_VERSION) \
		-c "apk update && apk upgrade --available --no-cache && rm -rf /var/cache/apk/* && apk add sqlite | grep sqlite"

test:
	docker run --rm -it --entrypoint cat --name $(CONTAINER_NAME) $(IMAGE_NAME):$(APP_VERSION) /etc/os-release | grep "Alpine Linux v3.19"
	docker run --rm -it --entrypoint cat --name $(CONTAINER_NAME) $(IMAGE_NAME):$(APP_VERSION) /etc/os-release | grep "VERSION_ID=3.19.0"
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME):$(APP_VERSION) sqlite3 --version | grep 3.44.2

destroy:
	-docker image rm alpine:$(ALPINE_VERSION)
	-docker image rm $(IMAGE_NAME):$(APP_VERSION)