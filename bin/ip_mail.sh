#!/bin/bash
# Author: Jozef Zuzelka
# http://go2linux.garron.me/what-is-my-public-ip-address-with-linux/
# http://tecadmin.net/5-commands-to-get-public-ip-using-linux-terminal/

if [ ! -f ~/tmp/.lastip ]; then
    touch ~/tmp/.lastip
fi

# Ziskaj adresu
WAN_IP=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')
LAN_IP=$(ip addr show | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')

DATE="$(date +%d.%b.%Y\ \ %R\ \ \(%A\))"

# Ak je ina ako naposledy
if [ "$WAN_IP" != "$(cat ~/tmp/.lastip)" ] ; then
    echo "$WAN_IP" > ~/tmp/.lastip
    # Posli mailom
    printf "HOSTNAME:\t$(hostname) \nUSER:\t$(whoami) \nDATE:\t$DATE \nWAN IP:\t$WAN_IP \nLAN IP:\t$LAN_IP \n" |  mutt -s "Toshiba's public IP" jozef.zuzelka@gmail.com &
fi
