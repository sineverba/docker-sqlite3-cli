# Define base env
ARG ALPINE_VERSION=3.18.4
# Get Image
FROM alpine:${ALPINE_VERSION}
# Update
RUN apk update && apk upgrade
# Install Sqlite
ARG SQLITE_VERSION=3.44.2-r0
RUN apk add sqlite=${SQLITE_VERSION}