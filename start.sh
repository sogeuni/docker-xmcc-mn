#!/bin/sh

# if 'masternodeprivkey' or 'externalip' does not exist it should just stop

if [ -z ${masternodeprivkey+x} ]; then
	echo "'masternodeprivkey' is unset"
	exit 1
fi
if [ -z ${externalip+x} ]; then
	echo "'externalip' is unset"
	exit 1
fi

# conf

USERNAME=$(pwgen -s 16 1)
PASSWORD=$(pwgen -s 64 1)

mkdir ~/.monoeciCore

cat << EOF > ~/.monoeciCore/monoeci.conf
rpcuser=$USERNAME
rpcpassword=$PASSWORD
rpcallowip=127.0.0.1
server=1
listen=1
daemon=1
maxconnections=24
masternode=1
masternodeprivkey=$masternodeprivkey
externalip=$externalip
EOF

# daemon

line="* * * * * cd /home/monoeci/sentinel && ./venv/bin/python bin/sentinel.py >/dev/null 2>&1"
(crontab -l 2>/dev/null; echo "$line") | crontab -

sudo cron

monoecid

tail -f /dev/null