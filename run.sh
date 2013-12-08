#!/bin/sh
LOCAL_FOLDER="/data/mysql"
TAG="sullof/mysql"
CONTAINER_ID=$(docker run -d -v $LOCAL_FOLDER:/var/lib/mysql $TAG)
echo $(docker inspect $CONTAINER_ID | grep IPAddress | awk '{ print $2 }' | tr -d ',"')
