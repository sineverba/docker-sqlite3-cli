IMAGE_NAME=sineverba/sqlite3-cli
CONTAINER_NAME=sqlite3-cli
VERSION=1.2.0-dev

build:
	docker build --tag $(IMAGE_NAME):$(VERSION) .

test:
	docker run --rm -it --entrypoint cat --name $(CONTAINER_NAME) $(IMAGE_NAME):$(VERSION) /etc/os-release | grep "Alpine Linux v3.18"
	docker run --name $(CONTAINER_NAME) --rm -it $(IMAGE_NAME):$(VERSION) sqlite3 --version | grep "3.41.2"

destroy:
	docker image rm alpine:3.18.2
	docker image rm $(IMAGE_NAME):$(VERSION)