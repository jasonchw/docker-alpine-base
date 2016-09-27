FROM alpine:3.4

ARG DUMB_INIT_VER=1.1.3

RUN apk update && apk upgrade && \
    apk add curl ca-certificates bash && \
    curl -Lfso /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VER}/dumb-init_${DUMB_INIT_VER}_amd64 && \
    chmod +x /usr/local/bin/dumb-init && \
    rm -rf /var/cache/apk/*

