CURRENT_DIR=$(PWD)

build:
	docker build --tag sineverba/testdockersqlite3 .

test:
	echo ${CURRENT_DIR}
	docker run --rm -it sineverba/testdockersqlite3 sqlite3 --version | grep "3.36.0"

spin:
	docker run --rm -it -v ${CURRENT_DIR}/database:/database sineverba/testdockersqlite3

destroy:
	docker image rm sineverba/testdockersqlite3