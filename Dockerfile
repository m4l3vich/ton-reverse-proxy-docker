# syntax=docker/dockerfile:1

# Build stage
FROM golang:alpine AS builder

RUN apk update && apk add git build-base

RUN git clone https://github.com/tonutils/reverse-proxy /app

WORKDIR /app
RUN make build

# Final stage
FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/build/ /app/build
COPY gen_config.sh /
RUN chmod +x /gen_config.sh

ENTRYPOINT ["build/tonutils-reverse-proxy"]