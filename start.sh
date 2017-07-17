#!/bin/bash

docker network create demo_internal
docker network create demo_dmz

volume=$(docker volume create --label app=demo --label service=redis)

docker run -d --net=demo_internal --name redis \
	-v ${volume}:/data \
	redis:3.2 redis-server --appendonly yes

docker run -d --net=demo_internal --name request-counter \
	-e REDIS_HOST=redis.demo_internal \
	mdulghier/request-counter

docker network connect demo_dmz request-counter
	
docker run -d --net=demo_dmz --name hello-world \
	-e REQUESTCOUNTERURL=http://request-counter.demo_dmz:8090 \
	mdulghier/hello-world



