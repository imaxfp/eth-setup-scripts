#! /bin/sh 
echo Welcome to the new account generation, please type path to the your geth data directory. For example './node0'
read ETH_HOME

mkdir -p $ETH_HOME
./geth --datadir $ETH_HOME account new
echo List of yours accounts:
./geth --datadir $ETH_HOME account list
