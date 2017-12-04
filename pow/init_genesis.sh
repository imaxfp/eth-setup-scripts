#! /bin/sh 
echo Welcome to the initialization script. Init your private network with custom genesis json file. 
echo Please type path to the geth data dirrectory. For instance './node0'
read ETH_HOME
echo Please type path to the your custom genesis file. For instance './CustomGenesis.json'
read GENESIS_FILE

mkdir -p $ETH_HOME 

./geth --datadir $ETH_HOME init $GENESIS_FILE
