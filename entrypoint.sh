#!/bin/bash


CONF_PATH=/etc/squid/squid.conf
CACHE_DIR=/var/cache/squid

# Traffic Control 
echo "Set traffic control..."

if [ -x /tc.sh ]; then
	/tc.sh
	# tc confirm
	tc qdisc show dev eth0
fi

mkdir -p ${CACHE_DIR}
chown squid:squid ${CACHE_DIR}

if [[ ! -d ${CACHE_DIR}/00 ]]; then
	echo "Initializing cache..."
	squid -N -f ${CONF_PATH} -z
fi

#cat ${CONF_PATH}

echo "starting squid..."

tail -f /var/log/squid/access.log /var/log/squid/cache.log & 

exec squid -f ${CONF_PATH} -NYCd 1
