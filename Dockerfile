FROM alpine:3.15.0

RUN apk update && apk upgrade

ENV CLI_VERSION 3.36.0-r0

RUN apk add sqlite=${CLI_VERSION}