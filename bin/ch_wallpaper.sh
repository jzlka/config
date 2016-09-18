#! /bin/bash
# Author: Jozef Zuzelka

WALLPAPERS="/mnt/data/Obrázky/Obrázky/nature"
ALIST=( `ls -w1 $WALLPAPERS/*.jpg` )
RANGE=${#ALIST[@]}
FOUND=0

#let "number = $RANDOM"
#let LASTNUM="`expr $(cat $WALLPAPERS/.last) + $number`"
#let "number = `expr $LASTNUM % $RANGE`"
#echo $number > $WALLPAPERS/.last

##NUM="`expr $( expr $(cat $WALLPAPERS/.last) + $RANDOM ) % $RANGE`"
##echo $NUM > $WALLPAPERS/.last

#nitrogen --set-scaled --save ${ALIST[$number]}

while [ $FOUND -eq 0 ]; do

NUM=`expr $RANDOM % $RANGE`

if [ "$(tail -n20 $WALLPAPERS/.last | grep "${ALIST[$NUM]}")" == "" ]; then
    echo "$NUM,${ALIST[$NUM]},`date`" >> $WALLPAPERS/.last
    nitrogen --set-scaled --save ${ALIST[$NUM]}
    FOUND=1
fi;

done;
