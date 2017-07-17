#!/bin/bash

docker pull docker.trigo.io/mdulghier/hello-world
docker pull docker.trigo.io/mdulghier/request-counter

docker rm -f request-counter
docker run -d --net=demo_internal --name request-counter \         
	-e REDIS_HOST=redis.demo_internal \         
	mdulghier/request-counter
