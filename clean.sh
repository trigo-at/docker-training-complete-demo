#!/bin/bash

docker rm -f redis
docker rm -f request-counter
docker rm -f hello-world

docker network rm demo_dmz
docker network rm demo_internal

volume=$(docker volume ls --filter label=service=redis -q)

docker volume rm ${volume}
