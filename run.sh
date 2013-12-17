#!/bin/sh

. ./image.conf

IMAGE="$REPOSITORY:$TAG"

DATA_FOLDER="/var/docker/$TAG"

if [ ! -d "$DATA_FOLDER" ]
then
	mkdir -p $DATA_FOLDER/var/lib/mysql
	mkdir -p $DATA_FOLDER/var/log/mysql
	mkdir -p $DATA_FOLDER/var/run/mysql
	mkdir -p $DATA_FOLDER/etc/mysql/conf.d
fi

cp my.cnf $DATA_FOLDER/etc/mysql/.

CONTAINER_ID=$(docker run -d \
	-v $DATA_FOLDER/var:/var:rw \
	-v $DATA_FOLDER/etc/mysql:/etc/mysql:rw \
	$IMAGE)

startie $TAG $CONTAINER_ID
