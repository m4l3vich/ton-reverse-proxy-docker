#!/bin/sh

if test -f config.json; then
  echo "gen_config: config.json already exists, exiting..."
  exit
fi

echo "gen_config: Running reverse-proxy for 5 seconds..."
timeout 5 ./build/tonutils-reverse-proxy

echo "gen_config: Here's the config.json:"
cat config.json
