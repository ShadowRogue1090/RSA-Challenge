#!/bin/bash
source ./config.cfg

## Create Network
docker network create "$NETWORK"

## Build Images
docker build -t user ./$USER_CONTAINER
docker build -t flag ./$FLAG_CONTAINER
docker build -t hacker ./$HACKER_CONTAINER


## Alice
docker run -d \
  --name "$USER_CONTAINER" \
  --network "$NETWORK" \
  -p 2222:22 \
  user


## Bob
docker run -d \
  --name "$FLAG_CONTAINER" \
  --network "$NETWORK" \
  flag


## Hackerbot9001
docker run -d \
  --name "$HACKER_CONTAINER" \
  --network "$NETWORK" \
  --cap-add=NET_ADMIN \
  --cap-add=NET_RAW \
  -p 2224:22 \
  hacker