#!/bin/bash
source ./config.cfg

## Destroy Networks

docker network rm "$NETWORK"
docker network rm "$HIDDEN_NETWORK"

## Build Images

docker rmi user
docker rmi flag
docker rmi hacker

## Destroy Containers

docker rm "$USER_CONTAINER"
docker rm "$FLAG_CONTAINER"
docker rm "$HACKER_CONTAINER"

echo "It is done"