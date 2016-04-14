#!/bin/bash

openssl genrsa 1024 > hermes.key
openssl req -new -x509 -nodes -subj '/CN=www.mydom.com/O=My Company Name LTD./C=US' -sha1 -days 365 -key hermes.key > hermes.cert

docker build -t hermes .
docker run \
    -it \
    --name hermes \
    --rm \
    -p 26:25 \
    -v './hermesrc:/etc/hermes/hermesrc:ro' \
    -v './hermes.key:/etc/hermes/hermes.key:ro' \
    -v './hermes.cert:/etc/hermes/hermes.cert:ro' \
    hermes
