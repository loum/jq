ARG ALPINE_DOCKER_VERSION

FROM alpine:${ALPINE_DOCKER_VERSION} as builder

WORKDIR /tmp

FROM alpine:${ALPINE_DOCKER_VERSION}

ARG JQ_VERSION
RUN set -eux; apk add --no-cache jq=${JQ_VERSION}

# Add our user and group first to make sure their IDs get assigned consistently,
# regardless of whatever dependencies get added
RUN addgroup -S -g 30998 jq &&\
 adduser -S -G jq -u 30990 jq

WORKDIR /home/jq
USER jq

ENTRYPOINT ["/usr/bin/jq"]
