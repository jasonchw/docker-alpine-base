FROM alpine:3.4

ARG DUMB_INIT_VER=1.1.3
ARG GOSU_VER=1.9

RUN apk update && apk upgrade && \
    apk add bash curl ca-certificates && \
    curl -Lfso /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VER}/dumb-init_${DUMB_INIT_VER}_amd64 && \
    chmod +x /usr/local/bin/dumb-init && \
    curl -Lfso /usr/local/bin/gosu https://github.com/tianon/gosu/releases/download/${GOSU_VER}/gosu-amd64 && \
    chmod +x /usr/local/bin/gosu && \
    gosu nobody true && \
    rm -rf /var/cache/apk/*

