#!/bin/bash
source ./config.cfg

## Create Networks

docker network create "$NETWORK"
docker network create "$HIDDEN_NETWORK"

## Build Images

docker build -t user ./$USER_CONTAINER
docker build -t flag ./$FLAG_CONTAINER
docker build -t hacker ./$HACKER_CONTAINER


## Create Containers

# docker run -d \
#     --name challenge4-ssh \
#     --network ch4-internal \
#     --network-alias jumper \
#     --dns 127.0.0.11 \
#     --dns-search "." \
#     -p 2223:2223 \
#     challenge4-ssh
