#!/bin/sh

. ./image.conf

IMAGE="$REPOSITORY:$TAG"

MYSQL_FOLDER="/data/$TAG/mysql"
if [ ! -d "$MYSQL_FOLDER" ]; then
	mkdir -p $MYSQL_FOLDER
fi

UPLOADS_FOLDER="/data/$TAG/uploads"
if [ ! -d "$UPLOADS_FOLDER" ]; then
	mkdir -p $UPLOADS_FOLDER
fi

CONTAINER_ID=$(docker run -d \
	-v $MYSQL_FOLDER:/var/lib/mysql:rw \
	-v $UPLOADS_FOLDER:/usr/share/nginx/www/wp-content/uploads:rw \
	$IMAGE)

startie $TAG $CONTAINER_ID
