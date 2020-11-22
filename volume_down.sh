#!/bin/bash

INCR=10
BASE="/usr/local/share/icons/gnome/"
SIZE="16x16"
ICON="/status/audio-volume-low.png"

amixer sset Master unmute "$INCR"%+ >/dev/null 2>&1
notify-send -i ""$BASE""$SIZE""$ICON"" -t 1000 "volume down"
