# Monoeci Masternode for Docker

This is a dockerized masternode for Monoeci (XMCC) - MonacoCoin project. This project is roughly based on [Monoeci's official tutorial](https://monoeci.io/tutorial-masternode-server/). You may need some basic knowledge on how masternodes work in order to understand the content of this page.

## Quickstart

Clone this repository first and build a docker image.

```
docker build -t xmcc-mn .
```
(xmcc-mn is just an example; you can choose whatever name you want)

There are two required variables: `masternodeprivkey` and `externalip`. `masternodeprivkey` is the value you get when you execute `masternode genkey` on your wallet's debug console. `externalip` is the IP address of the server you want your masternode to run on.

If you got these two variables then you can simple start the masternode docker using the following command:

```
docker run -e masternodeprivkey=<masternodeprivkey> -e externalip=<IP Address> -it -d xmcc-mn
```

If you run for the first time, the masternode daemon needs to be synchorized with the network and it'll take some time before you can actually connect it with your remote wallet. You can check the basic state of the daemon server with the provided `check.sh` script. Once the daemon is ready, you'll get an output similar to one below:

```
{
  "version": 120200,
  "protocolversion": 70206,
  "walletversion": 61000,
  "balance": 0.00000000,
  "privatesend_balance": 0.00000000,
  "blocks": 149914,
  "timeoffset": 0,
  "connections": 10,
  "proxy": "",
  "difficulty": 1296164.479339077,
  "testnet": false,
  "keypoololdest": 1518724550,
  "keypoolsize": 1001,
  "paytxfee": 0.00000000,
  "relayfee": 0.00010000,
  "errors": ""
}
{
  "AssetID": 999,
  "AssetName": "MASTERNODE_SYNC_FINISHED",
  "Attempt": 0,
  "IsBlockchainSynced": true,
  "IsMasternodeListSynced": true,
  "IsWinnersListSynced": true,
  "IsSynced": true,
  "IsFailed": false
}
{
  "vin": "CTxIn(COutPoint(<some value>, 0), scriptSig=)",
  "service": "<some ip address>:24157",
  "payee": "<some address>",
  "status": "Masternode successfully started"
}
```

The value `blocks` should be the blocksize, `AssetID` should be 999 and `status` should say `"Masternode successfully started"`.


## Donations

If this project was helpful, kindly donate to the following address so that I can continue improve the stability of this project:

(Monoeci, XMCC): `MJHzjFcbrqiRXdEPQii35WKxQoHyC9EN9e`

Thanks and happy masternoding! :)