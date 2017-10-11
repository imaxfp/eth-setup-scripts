#! /bin/sh
source ./main.sh

CMD="
geth --datadir ./node1
--rpcapi
\"db,personal,eth,net,web3\" 
--rpccorsdomain=\"*\"
--networkid 2048
--rpc
$BOOT_NODES
--port 30301
--rpcport 40401
console 
2>>./node1/node.log"

echo $CMD
$CMD
