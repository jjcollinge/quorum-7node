#!/bin/bash -x

# Clean up existing run
rm -rf quorum-node

# Fetch quorum node docker file
git clone https://github.com/jjcollinge/quorum-node.git

# For each sub directory
for d in `find . -maxdepth 1 -not -path . -type d -not -name quorum-node`
do
    DIR_NAME=`echo $d | cut -c3-`
    IMG_NAME="quorum-$DIR_NAME"
    (cd "$d" && \
    # Clean up existing run
    rm -f Dockerfile && \
    rm -f start.sh && \
    # Copy in required files
    cp ../quorum-node/Dockerfile . && \
    cp ../quorum-node/start.sh . && \
    # Run docker container
    docker build -t $IMG_NAME . && \
    docker run -d --net=host $IMG_NAME)
    # Allow bootnode to start before starting the rest of the nodes
    if [[ $DIR_NAME == "node1" ]]; then
        sleep 15
    fi
done
