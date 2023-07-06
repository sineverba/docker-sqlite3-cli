FROM alpine:3.18.2

RUN apk update && apk upgrade

ENV CLI_VERSION 3.41.2-r2

RUN apk add sqlite=${CLI_VERSION}