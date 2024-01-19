# Define base env
ARG ALPINE_VERSION=3.19.0
# Get Image
FROM alpine:${ALPINE_VERSION}
# Update
RUN apk update && \
    apk upgrade --available --no-cache && \
    rm -rf /var/cache/apk/*
# Install Sqlite
ARG SQLITE_VERSION=3.44.2-r0
RUN apk add sqlite=${SQLITE_VERSION}