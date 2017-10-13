#! /bin/sh
source ./main.sh

CMD="
./geth --datadir ./node2
--rpcapi
\"db,personal,eth,net,web3\" 
--rpccorsdomain=\"*\"
--networkid 2048
--rpc
$BOOT_NODES
--port 30302
--rpcport 40402
console 
2>>./node2/node.log"

echo $CMD
$CMD
