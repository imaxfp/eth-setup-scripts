#! /bin/sh

BOOT_NODES=""
MINER=""
YES_OR_NO="Please answer yes or no.";

echo Run node script, please type path to the your geth data dirictory. For example './node0'
read ETH_HOME

echo Set port
read PORT

echo Set rpcport
read RPC_PORT

addBootNode () {
while true; do
    read -p "Do you wish to add bootnode?" yn
    case $yn in
        [Yy]* ) {
	    echo Set bootnode key
            read BOOT_NODE_KEY
            echo Set bootnode ip
            read BOOT_NODE_IP
            echo Set bootnode port
            read BOOT_NODE_PORT
	    bootnodeStr $BOOT_NODE_KEY $BOOT_NODE_IP $BOOT_NODE_PORT
	};;
        [Nn]* ) break;;
        * ) echo $YES_OR_NO;
    esac
done
}

#enode://pubkey1@ip1:port1,enode://pubkey2@ip2:port2,enode://pubkey3@ip3:port3
bootnodeStr () {
     eval pubkey="$1"
     eval ip="$2"
     eval port="$3"
     BOOT_NODES=$BOOT_NODES"enode://$pubkey@$ip:$port,"
}
addBootNode

mkdir -p $ETH_HOME
echo "Do you want to run node in miner mode? type yes/no "
read MINER_MODE
  if [ "$MINER_MODE" = "yes" ]; then MINER="--mine"
  fi


case $BOOT_NODES in
  (*[![:blank:]]*) BOOT_NODES="--bootnodes ${BOOT_NODES%?}";;
esac

CMD="./geth --datadir $ETH_HOME --networkid 2048 $BOOT_NODES --port $PORT --rpcport $RPC_PORT  --cache=512 --rpcapi personal,db,eth,net,web3 --rpc $MINER console 2>>$ETH_HOME/node.log"
echo "cmd = "$CMD
$CMD
