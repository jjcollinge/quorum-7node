#!/bin/bash -x

# Check the necessary directories have been mounted
if [ ! -d "/node" ]; then
  echo "ERROR: the node directory has not been correctly mounted"
  exit 1;
fi

# Source enviroment file
. /node/env.sh

# Make log directories
mkdir -p tempdata/logs

# Configure the node by moving files to the correct directories
echo "Configuring node" >>tempdata/logs/init.log
mkdir -p tempdata/datadir/keystore
stat -t -- keys/key* >/dev/null 2>&1 && cp keys/key* tempdata/datadir/keystore
sleep 2

# Initialise geth directory
geth --datadir tempdata/datadir init template/genesis.json

sleep 10

# If no existing bootnode ip provided, start a local bootnode
if [ -z "$BOOTNODE_IP" ];
then
    echo "Starting bootnode" >>tempdata/logs/init.log
    BOOTNODE_IP="127.0.0.1"
    nohup bootnode --nodekeyhex "$BOOTNODE_KEYHEX" --addr="$BOOTNODE_IP:$BOOTNODE_PORT" 2>> tempdata/logs/bootnode.log &
    sleep 6
fi

# Start local constellation
echo "Starting constellation" >>tempdata/logs/init.log
nohup constellation-node /node/node.conf 2>>tempdata/logs/constellation.log &

sleep 10
# Set geth arguments
export BOOTNODE_ENODE="enode://$BOOTNODE_PUBLICKEY@[$BOOTNODE_IP]:$BOOTNODE_PORT"

# Start geth
echo "Starting geth" >>tempdata/logs/init.log
/node/gethbootstrap.sh 2>>tempdata/logs/geth.log &

# Keep container alive forever
tail -f /dev/null