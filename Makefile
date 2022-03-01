CURRENT_DIR=$(PWD)
IMAGE_NAME=sineverba/testdockersqlite3
CONTAINER_NAME=testdockersqlite3

build:
	docker build --tag $(IMAGE_NAME) .

test:
	docker run --name $(CONTAINER_NAME) --rm -it $(IMAGE_NAME) sqlite3 --version | grep "3.36.0"

spin:
	docker run --name $(CONTAINER_NAME) --rm -it -v ${CURRENT_DIR}/database:/database $(IMAGE_NAME)

destroy:
	docker image rm $(IMAGE_NAME)