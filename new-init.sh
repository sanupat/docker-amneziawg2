#!/bin/bash

echo "=============================="
echo "$(date)"
echo "Container startup"

for conf in /etc/amnezia/amneziawg/*.conf; do
    iface=$(basename "$conf" .conf)

    # Kill only if interface exists and is up
    if ip link show "$iface" &>/dev/null; then
        awg-quick down "$iface"
    fi

    # Start if config exists
    if [ -f "$conf" ]; then
        awg-quick up "$iface"
    fi
done

tail -f /dev/null
