#!/bin/sh
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <svg> <size>"
    exit 1
fi

IMGSIZE=$2
IFILE=$1
FILENAME=$(basename "$IFILE")
OFILE="export_${FILENAME%.*}_${IMGSIZE}.png"


rsvg-convert -a -w "$IMGSIZE" -h "$IMGSIZE" "$IFILE" > "tmp_$OFILE" && convert -background none -resize ${IMGSIZE}x${IMGSIZE} -gravity center -extent ${IMGSIZE}x${IMGSIZE} "tmp_$OFILE" "$OFILE" && rm "tmp_$OFILE"

