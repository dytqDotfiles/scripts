#!/bin/bash

INCR=10
BASE="/usr/share/icons/Adwaita/"
SIZE="16x16"
ICON_MUTE="/status/audio-volume-muted-symbolic.symbolic.png"
ICON_UNMUTE="/status/audio-volume-overamplified-symbolic.symbolic.png"

CURRENT_STATE=`amixer get Master | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]'`

if [[ $CURRENT_STATE == '[on]' ]]; then
    amixer set Master mute
else
    amixer set Master unmute
    amixer set Front unmute
    amixer set Headphone unmute
    amixer set Speaker unmute
fi

CMD_AMIX=$(amixer get Master 2>&1)
CMD_AMIX=$(echo $CMD_AMIX | grep "off" 2>&1)

AMIX_POURCENT=$(amixer sget Master | grep "%" | cut -f 6 -d ' ')

#if [ -n "$CMD_AMIX" ]
#then
#	notify-send -i ""$BASE""$SIZE""$ICON_MUTE"" -t 500 "volume mute"
#else
#	notify-send -i ""$BASE""$SIZE""$ICON_UNMUTE"" -t 500 "volume unmute $AMIX_POURCENT"
#fi
