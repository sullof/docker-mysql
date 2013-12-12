#!/bin/bash

. ./image.conf

docker build -t "$REPOSITORY:$TAG" .
