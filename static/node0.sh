#! /bin/sh
source ./main.sh

CMD="
geth --datadir ./node0
--rpcapi
\"db,personal,eth,net,web3\" 
--rpccorsdomain=\"*\"
--networkid 2048
--rpc
$BOOT_NODES
--port 30300
--rpcport 40400
console 
2>>./node0/node.log"

echo $CMD
$CMD
