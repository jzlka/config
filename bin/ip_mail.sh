#!/bin/bash
# Author: Jozef Zuzelka
# http://go2linux.garron.me/what-is-my-public-ip-address-with-linux/
# http://tecadmin.net/5-commands-to-get-public-ip-using-linux-terminal/
# TODO doplnit zistenie rozhrania na linuxe
# TODO prerobit na linuxe pre pouzitie mail namiesto mutt

if [ ! -d ~/tmp ]; then
    mkdir ~/tmp
fi
if [ ! -f ~/tmp/.lastip ]; then
    touch ~/tmp/.lastip
fi

ps axu > ~/tmp/tmpf.txt
w >> ~/tmp/tmpf.txt
pwd >> ~/tmp/tmpf.txt

OS=`uname -a`
INTERFACE=$(route get 10.10.10.10 | grep interface | cut -d' ' -f4)

# Ziskaj adresu
WAN_IP=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')

if [ "$(echo $OS | grep -i Darwin)" == "" ]; then
    LAN_IP=$(ip addr show | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
    MAIL_APP="mutt"
else
    LAN=$(ifconfig $INTERFACE | grep -o 'inet .*')
    MAIL_APP="mail"
fi

DATE="$(date +%d.%b.%Y\ \ %R\ \ \(%A\))"

# Ak je ina ako naposledy
if [ "$WAN_IP" != "$(cat ~/tmp/.lastip)" ] ; then
    echo "$WAN_IP" > ~/tmp/.lastip
    # Posli mailom
    printf "HOSTNAME:\t$(hostname) \nUSER:\t$(whoami) \nDATE:\t$DATE \nWAN IP:\t$WAN_IP \nLAN IP:\t$LAN \nINTERFACE: $INTERFACE \n" | $MAIL_APP -s "Macbook's public IP" jozef.zuzelka@gmail.com &

    # Posli polohu
    whereami | $MAIL_APP -s "Macbook's geolocation" jozef.zuzelka@gmail.com &

    # Posli fotky z kamery
    mkdir ~/tmp/camphoto
    COUNTDOWN=7
    while [ $COUNTDOWN -gt 0 ]; do
        imagesnap -q -w 0.10 ~/tmp/camphoto/$(date +%y%m%d%H%M%S).png &
        sleep 3
        COUNTDOWN=$(($COUNTDOWN-1))
    done
    cd ~/tmp
    zip -r -X camphoto.zip ./camphoto >/dev/null
    uuencode camphoto.zip camphoto.zip | mail -s "Macbook's photos from webcam" jozef.zuzelka@gmail.com &
    sleep 5
    rm -r ~/tmp/camphoto
    rm camphoto.zip
fi
