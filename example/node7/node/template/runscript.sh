#!/bin/bash
PRIVATE_CONFIG=tm1.conf geth --exec "loadScript(\"$1\")" attach ipc:tempdata/node/geth.ipc