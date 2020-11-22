#!/bin/bash

INCR=10
BASE="/usr/local/share/icons/gnome/"
SIZE="16x16"
ICON_MUTE="/status/audio-volume-muted.png"
ICON_UNMUTE="/status/audio-volume-high.png"

amixer sset Master toggle >/dev/null 2>&1

CMD_AMIX=$(amixer get Master 2>&1)

CMD_AMIX=$(echo $CMD_AMIX | grep "off" 2>&1)

if [ -n "$CMD_AMIX" ]
then
	notify-send -i ""$BASE""$SIZE""$ICON_MUTE"" -t 200 "volume mute"
else
	notify-send -i ""$BASE""$SIZE""$ICON_UNMUTE"" -t 200 "volume unmute"
fi
