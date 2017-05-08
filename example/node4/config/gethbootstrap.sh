#!/bin/bash
PRIVATE_CONFIG=node.conf nohup geth --datadir $DATA_PATH --bootnodes $BOOTNODE_ENODE --networkid $GETH_NETWORK_ID --rpc --rpcaddr 0.0.0.0 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum --rpcport $RPC_PORT --port $GETH_PORT --voteaccount 0x9186eb3d20cbd1f5f992a950d808c4495153abd5 --votepassword "" 2>> $GETH_LOG &
