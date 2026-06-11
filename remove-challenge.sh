#!/bin/bash
source ./config.cfg

## This script will clean up the challenge environment by removing the created containers, networks, and images.

## Kill Containers
docker kill "$USER_CONTAINER"
docker kill "$FLAG_CONTAINER"
docker kill "$HACKER_CONTAINER"

## Destroy Networks

docker network rm public-net
docker network rm private-net

## Destroy Containers

docker rm "$USER_CONTAINER"
docker rm "$FLAG_CONTAINER"
docker rm "$HACKER_CONTAINER"

## Remove Images

docker rmi user
docker rmi flag
docker rmi hacker

echo "It is done"