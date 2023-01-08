FROM alpine:3.17.0

RUN apk update && apk upgrade

ENV CLI_VERSION 3.40.1-r0

RUN apk add sqlite=${CLI_VERSION}