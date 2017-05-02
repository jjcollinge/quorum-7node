#!/bin/bash
PRIVATE_CONFIG=node.conf nohup geth --datadir tempdata/datadir --bootnodes $BOOTNODE_ENODE --networkid $GETH_NETWORK_ID --rpc --rpcaddr 0.0.0.0 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum --rpcport $RPC_PORT --port $GETH_PORT --voteaccount 0x0638e1574728b6d862dd5d3a3e0942c3be47d996 --votepassword "" 2>> tempdata/logs/geth.log &
