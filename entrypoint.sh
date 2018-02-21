#!/bin/sh
TRANSMISSION_USER="${TRANSMISSION_USER:-"transmission"}"
TRANSMISSION_PASSWORD="${TRANSMISSION_PASSWORD:-"transmission"}"
TRANSMISSION_DIR="${TRANSMISSION_DIR:-"/var/lib/transmission"}"
if [ $TRANSMISSION_PASSWORD == "transmission" ]; then
	echo "Warning you use default password, you should change it"
fi
exec /usr/bin/transmission-daemon -f --no-portmap --log-error --config-dir /etc/transmission-daemon/ --username "$TRANSMISSION_USER" --password "$TRANSMISSION_PASSWORD"  --download-dir "$TRANSMISSION_DIR" --incomplete-dir "$TRANSMISSION_INCOMPLETE" --bind-address-ipv4 "0.0.0.0" --auth
