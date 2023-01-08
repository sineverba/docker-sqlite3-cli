IMAGE_NAME=sineverba/sqlite3-cli
CONTAINER_NAME=sqlite3-cli
VERSION=1.1.0-dev
TOPDIR=$(PWD)

build:
	docker build --tag $(IMAGE_NAME):$(VERSION) .

test:
	docker run --rm -it --entrypoint cat --name $(CONTAINER_NAME) $(IMAGE_NAME):$(VERSION) /etc/os-release | grep "Alpine Linux v3.17"
	docker run --name $(CONTAINER_NAME) --rm -it $(IMAGE_NAME):$(VERSION) sqlite3 --version | grep "3.40.1"

destroy:
	docker image rm $(IMAGE_NAME):$(VERSION)