#!/bin/bash

for d in `find . -maxdepth 1 ! -path . -type d`
do
    if [[ -d $d ]]; then
        DIR_NAME=`echo $d | cut -c3-`
        IMG_NAME="quorum-$DIR_NAME"
         # Clean up existing run
        (cd "$d" && \
         rm -f Dockerfile && \
         rm -rf node/template && \
         # Copy in required files
         cp ../../quorum/Dockerfile . && \
         cp -rp ../../template node/ && \
         # Run docker container
         docker build -t $IMG_NAME . && \
         docker run -d --net=host $IMG_NAME)
    fi
done
