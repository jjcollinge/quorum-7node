#!/bin/bash
PRIVATE_CONFIG=node.conf nohup geth --datadir tempdata/datadir --bootnodes $BOOTNODE_ENODE --networkid $GETH_NETWORK_ID --rpc --rpcaddr 0.0.0.0 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum --rpcport $RPC_PORT --port $GETH_PORT --unlock 0 --password /node/passwords.txt 2>> tempdata/logs/geth.log &
