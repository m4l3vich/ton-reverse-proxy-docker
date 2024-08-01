# syntax=docker/dockerfile:1

FROM golang:alpine

RUN apk update && apk add git build-base

RUN git clone https://github.com/tonutils/reverse-proxy /app

WORKDIR /app
COPY gen_config.sh /
RUN chmod +x /gen_config.sh
RUN make build

ENTRYPOINT ["build/tonutils-reverse-proxy"]
