#!/bin/bash

INCR=10
BASE="/usr/share/icons/Adwaita/"
SIZE="16x16"
ICON="/status/audio-volume-low-symbolic.symbolic.png"

AMIX_POURCENT=$(amixer sget Master | grep "%" | cut -f 6 -d ' ')

amixer sset Master unmute "$INCR"%- >/dev/null 2>&1
#notify-send -i ""$BASE""$SIZE""$ICON"" -t 200 "volume down $AMIX_POURCENT" 
