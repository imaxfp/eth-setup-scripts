#! /bin/sh
source ./main.sh

CMD="
./geth --datadir ./miner
--rpccorsdomain=\"*\"
--networkid 2048
--rpc
--port 30000
--rpcport 40000
$BOOT_NODES
--mine
console 
2>>./miner/miner.log"

echo $CMD
$CMD
