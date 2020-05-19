#!/bin/bash -x

echo "Sleep for 30 seconds so the master node has initialised"
sleep 30

echo "Start the chain"
multichaind -daemon -txindex -shrinkdebugfilesize $CHAINNAME@$MASTER_NODE:$NETWORK_PORT

echo "Sleep for 30 seconds so the slave node has initialised"
sleep 30

echo "Setup /root/.multichain/$CHAINNAME/multichain.conf"
cat << EOF > /root/.multichain/$CHAINNAME/multichain.conf
rpcuser=$RPC_USER
rpcpassword=$RPC_PASSWORD
rpcallowip=$RPC_ALLOW_IP
rpcport=$RPC_PORT
EOF

echo "Setup /root/explorer.conf"
cat << EOF > /root/explorer.conf
port 2750
host 0.0.0.0
datadir += [{
        "dirname": "~/.multichain/$CHAINNAME",
        "loader": "default",
        "chain": "MultiChain $CHAINNAME",
        "policy": "MultiChain"
        }]
dbtype = sqlite3
connect-args = dockerchain.explorer.sqlite
EOF

echo "Run the explorer"
python -m Mce.abe --config /root/explorer.conf --commit-bytes 100000 --no-serve
python -m Mce.abe --config /root/explorer.conf
