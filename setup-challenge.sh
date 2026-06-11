#!/bin/bash
source ./config.cfg

docker network create public-net
docker network create private-net


docker build -t user ./$USER_CONTAINER
docker build -t flag ./$FLAG_CONTAINER
docker build -t hacker ./$HACKER_CONTAINER


# Alice (public only)
docker run -d \
  --name "$USER_CONTAINER" \
  --network public-net \
  -p 2222:22 \
  user


# Real Bob (private only)
docker run -d \
  --name "$FLAG_CONTAINER" \
  --network private-net \
  --network-alias real-bob \
  flag


# Hackerbot (bridge between both networks)
docker run -d \
  --name "$HACKER_CONTAINER" \
  --network public-net \
  --network-alias bob \
  --cap-add=NET_ADMIN \
  --cap-add=NET_RAW \
  hacker


# Attach Hackerbot to private network as well
docker network connect private-net "$HACKER_CONTAINER"