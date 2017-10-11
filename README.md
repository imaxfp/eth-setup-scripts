# Setup scripts
How to setup your private eth network or join to the existing one

## Preconditions
1. Download and install the latest version of geth by the following link https://geth.ethereum.org/downloads/

### 1. Generate new encrypted account 
bash ./new_account.sh

```bash
Welcome to the new account generation, please type path to the your geth data dirictory. For example ./node0
/../node0
WARN [] No etherbase set and no accounts found as default 
Your new account is locked with a password. Please give a password. Do not forget this password.
Passphrase: 
Repeat passphrase: 
Address: {cce0aa3116b9079f8da928589202e08eb630c303}
List of yoyrs accouns:
Account #0: {cce0aa3116b9079f8da928589202e08eb630c303} keystore:/.../UTC--2017-10-09T11-22-11.757525149Z--cce0aa3116b9079f8da928589202e08eb630c303
```


### 2. Init node by initial genesis script 

##### 2.1 Edit your CustomGenesis.json and set your address to the 'alloc' section fo initial balance.
 
##### 2.2 Run bash ./init_genesis.sh

```bash
Welcome to the initialization script. Init your private network with custom genesis json file.
Please type path to the geth data directory. For instance ./node0
/../node0
Please type path to the your custom genesis file. For instance ./CustomGenesis.json
./CustomGenesis.json
INFO [] Allocated cache and file handles         database=/../node0/geth/chaindata cache=16 handles=16
INFO [] Writing custom genesis block 
INFO [] Successfully wrote genesis state         database=chaindata hash=029f90…945ef4
INFO [] Allocated cache and file handles         database=/../node0/geth/lightchaindata cache=16 handles=16
INFO [] Writing custom genesis block 
INFO [] Successfully wrote genesis state         database=lightchaindata hash=029f90…945ef4
```


### 3. Run your private network with static scripts, simple way.
##### 3.1 Repeat steps 1 and 2 for all nodes - node0, node1, etc. `Please be sure, all your nodes have the same init genesis block`
##### 3.2 Go to the ./static and cp node0.sh like node1.sh, node2.sh, etc. Change '--rpcport', '--port' and '--datadir'.
##### 3.3 Run node0.sh, node1.sh, etc.
##### 3.4 Edit main.sh. Copy 'enode' keys to the main.sh
For example:
```bash
enode://94c5f9b4f7a77e8548f3c688c5eacfe5f02fb4352c73c6e193f6f3ab0cc3426d43276cf48bff13b4bbbbfcc6d4cd267f51070352a1ac272446abae363bf9dc86@127.0.0.1:30300,
enode://d76f47545f4c8e00552eaf8d5b2dfb7e841e82a3628d9240bb7925b7279c7df17ff838c7a3f7e499aa8f47d4e32e9310e002b601990e20ca6b8f232576055176@127.0.0.1:30301
...
```
##### 3.5 Restart your network.
##### 3.6 Run miner.sh
 

### 4. Run your private network with dynamic scripts `for advanced users`.

```bash
Set port
33333
Set rpcport
44444
Do you wish to add bootnode?
no
Do you want to run node in miner mode? type yes/no 
yes
cmd = ./geth --datadir /../node0 --networkid 15 --port 33333 --rpcport 44444 --cache=512 --rpcapi personal,db,eth,net,web3 --rpc --mine console 2>>/../node0/node.log
INFO [10-10|08:51:55] Starting peer-to-peer node               instance=Geth/v1.7.0-stable/darwin-amd64/go1.9
INFO [10-10|08:51:55] Allocated cache and file handles         database=/../node0/geth/chaindata cache=512 handles=1024
INFO [10-10|08:51:55] Initialised chain configuration          config="{ChainID: 204815108 Homestead: 0 DAO: <nil> DAOSupport: false EIP150: <nil> EIP155: 0 EIP158: 0 Byzantium: <nil> Engine: unknown}"
INFO [10-10|08:51:55] Disk storage enabled for ethash caches   dir=/../node0/geth/ethash count=3
INFO [10-10|08:51:55] Disk storage enabled for ethash DAGs     dir=/../node0/.ethash               count=2
INFO [10-10|08:51:55] Initialising Ethereum protocol           versions="[63 62]" network=15
INFO [10-10|08:51:55] Loaded most recent local header          number=6 hash=409ebb…ba1ded td=1227039411
INFO [10-10|08:51:55] Loaded most recent local full block      number=6 hash=409ebb…ba1ded td=1227039411
INFO [10-10|08:51:55] Loaded most recent local fast block      number=6 hash=409ebb…ba1ded td=1227039411
INFO [10-10|08:51:55] Loaded local transaction journal         transactions=0 dropped=0
INFO [10-10|08:51:55] Regenerated local transaction journal    transactions=0 accounts=0
WARN [10-10|08:51:55] Blockchain not empty, fast sync disabled 
INFO [10-10|08:51:55] Starting P2P networking 
INFO [10-10|08:51:57] UDP listener up                          self=enode://b3b6b111867260a5ab50edbeb1e9211b4a6bb0175774a813276814e3e0ee92c046873ae93fa969558862c46642e65655b300b278d522de9019d3712f39505d3c@[::]:33333
INFO [10-10|08:51:57] RLPx listener up                         self=enode://b3b6b111867260a5ab50edbeb1e9211b4a6bb0175774a813276814e3e0ee92c046873ae93fa969558862c46642e65655b300b278d522de9019d3712f39505d3c@[::]:33333
INFO [10-10|08:51:57] IPC endpoint opened: /../node0/geth.ipc 
INFO [10-10|08:51:57] HTTP endpoint opened: http://127.0.0.1:44444 
INFO [10-10|08:51:57] Transaction pool price threshold updated price=18000000000
INFO [10-10|08:51:57] Starting mining operation 
INFO [10-10|08:51:57] Commit new mining work                   number=7 txs=0 uncles=0 elapsed=320.61µs
Welcome to the Geth JavaScript console!

instance: Geth/v1.7.0-stable/darwin-amd64/go1.9
coinbase: 0x2b48f73fc85ff031ffa8e80934f30ceec24ecaca
at block: 6 (Tue, 10 Oct 2017 08:43:23 EEST)
 datadir: /../node0
 modules: admin:1.0 debug:1.0 eth:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

```

##### 4.1 Type 'admin' into console 
```json
> admin
{
  datadir: "/../node0",
  nodeInfo: {
    enode: "enode://b3b6b111867260a5ab50edbeb1e9211b4a6bb0175774a813276814e3e0ee92c046873ae93fa969558862c46642e65655b300b278d522de9019d3712f39505d3c@[::]:33333",
    id: "b3b6b111867260a5ab50edbeb1e9211b4a6bb0175774a813276814e3e0ee92c046873ae93fa969558862c46642e65655b300b278d522de9019d3712f39505d3c",
    ip: "::",
    listenAddr: "[::]:33333",
    name: "Geth/v1.7.0-stable/darwin-amd64/go1.9",
    ports: {
      discovery: 33333,
      listener: 33333
    },
    protocols: {
      eth: {
        difficulty: 1227039411,
        genesis: "0x6f1d941d9962583ad941a368cc5eba9a6d0a84b205138f7c8c5da5dddcfd96af",
        head: "0x409ebb0f7e50fa1e61412efa47a95fec67dc4843ebd097631ff5da0e61ba1ded",
        network: 15
      }
    }
  },
  peers: [],
  addPeer: function(),
  exportChain: function(),
  getDatadir: function(callback),
  getNodeInfo: function(callback),
  getPeers: function(callback),
  importChain: function(),
  removePeer: function(),
  sleep: function github.com/ethereum/go-ethereum/console.(*bridge).Sleep-fm(),
  sleepBlocks: function github.com/ethereum/go-ethereum/console.(*bridge).SleepBlocks-fm(),
  startRPC: function(),
  startWS: function(),
  stopRPC: function(),
  stopWS: function()
}
```
#### 4.2 Run node with boot node key

bash run.sh
```bash
Run node script, please type path to the your geth data dirictory. For example ./node0
/../node1
Set port
33331
Set rpcport
44441
Do you wish to add bootnode?
yes
Set bootnode key
b3b6b111867260a5ab50edbeb1e9211b4a6bb0175774a813276814e3e0ee92c046873ae93fa969558862c46642e65655b300b278d522de9019d3712f39505d3c
Set bootnode ip
127.0.0.1
Set bootnode port
33333
Do you wish to add bootnode?
no
Do you want to run node in miner mode? type yes/no 
no
```

