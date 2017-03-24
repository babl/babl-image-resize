#!/bin/bash

# be verbose in debug mode
if [[ $BABL_DEBUG ]]; then
  set -x
fi

if [[ $QUALITY && ${QUALITY-x} ]]; then
  quality="-quality $QUALITY"
fi

if [[ $DPI && ${DPI-x} ]]; then
  dpi="-density $DPI"
fi

# Maximize by default
minimize="^"
if [[ $MINIMIZE && ${MINIMIZE-x} ]]; then
  minimize=""
fi

format=${FORMAT-png}
background=${BACKGROUND-none}

convert -units PixelsPerInch -background $background - -resize "${WIDTH}x${HEIGHT}$minimize" -gravity center -extent "${WIDTH}x${HEIGHT}" $dpi $quality $format:-
