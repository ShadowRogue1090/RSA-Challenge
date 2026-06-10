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

# User (Alice)
docker run -d \
  --name "$USER_CONTAINER" \
  --network "$NETWORK" \
  -p 2222:22 \
  user

# Flag (Bob)
docker run -d \
  --name "$FLAG_CONTAINER" \
  --network "$NETWORK" \
  flag

# Hacker (Hackerbot9001)
  docker run -d \
  --name "$HACKER_CONTAINER" \
  --network "$NETWORK" \
  -p 2222:22 \
  hacker
