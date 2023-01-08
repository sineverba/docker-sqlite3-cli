Docker Sqlite3 CLI
==================

> Docker image to use Sqlite3 CLI without installing it

| CD / CI   | Status |
| --------- | ------ |
| Semaphore CI | [![Build Status](https://sineverba.semaphoreci.com/badges/docker-sqlite3-cli/branches/master.svg)](https://sineverba.semaphoreci.com/projects/docker-sqlite3-cli) |


## Usage

`$ docker run --rm -it sineverba/sqlite3-cli:1.1.0 sqlite3 [COMMAND]`

## To enter inside container:

`docker run --rm -it -v ${PWD}/database:/database sineverba/sqlite3-cli:1.1.0`

## Github / image tags and versions

| Github / Docker Image tag | Sqlite3 version | Platform |
| ------------------------- | ----------- | -------- |
| latest | 3.40.1 | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.0.0 | 3.36.0 | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |