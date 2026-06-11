#!/bin/bash
source ./config.cfg

docker network create "$NETWORK"

docker build -t user ./$USER_CONTAINER
docker build -t flag ./$FLAG_CONTAINER
docker build -t hacker ./$HACKER_CONTAINER


# Alice
docker run -d \
  --name "$USER_CONTAINER" \
  --network "$NETWORK" \
  -p 2222:22 \
  user


# Real Bob (backend service)
docker run -d \
  --name real-bob \
  --network "$NETWORK" \
  --network-alias real-bob \
  flag


# Hackerbot (MITM proxy exposed as "bob")
docker run -d \
  --name "$HACKER_CONTAINER" \
  --network "$NETWORK" \
  --network-alias bob \
  -p 2224:22 \
  hacker