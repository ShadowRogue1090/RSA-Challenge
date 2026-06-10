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

docker run -d \
  --name "$USER_CONTAINER" \
  --network "$NETWORK" \
  -p 2222:22 \
  user
