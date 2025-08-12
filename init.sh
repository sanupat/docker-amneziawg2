#!/bin/bash
echo "Container startup"
# kill daemons in case of restart
awg-quick down awg0
# start daemons if configured
if [ -f /etc/amnezia/amneziawg/awg0.conf ]; then (awg-quick up awg0); fi
tail -f /dev/null
