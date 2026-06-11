#!/bin/bash
source ./config.cfg

## Create Network
docker network create "$NETWORK"

## Build Images
docker build -t user ./$USER_CONTAINER
docker build -t flag ./$FLAG_CONTAINER
docker build -t hacker ./$HACKER_CONTAINER


## User (Alice)
docker run -d \
  --name "$USER_CONTAINER" \
  --network "$NETWORK" \
  -p 2222:22 \
  user


## Real Bob (hidden service)
docker run -d \
  --name "$FLAG_CONTAINER" \
  --network "$NETWORK" \
  flag


## Hackerbot (MITM gateway)
docker run -d \
  --name "$HACKER_CONTAINER" \
  --network "$NETWORK" \
  --cap-add=NET_ADMIN \
  --cap-add=NET_RAW \
  --network-alias bob \
  --sysctl net.ipv4.ip_forward=1 \
  -p 2224:22 \
  hacker