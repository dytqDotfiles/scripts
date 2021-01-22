
get_volume=$(amixer get Master| grep "Mono:" | cut -d ' ' -f 6 | sed -e "s/\[//g" | sed -e "s/\]//g" | sed -e "s/\%//g")

CURRENT_STATE=`amixer get Master | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]'`

if [[ $CURRENT_STATE == '[on]' ]]
then
	ICON=""
else
	ICON=""
fi

if [ $get_volume -eq 0 ]
then
	echo "     "
elif [ $get_volume -lt 20 ]
then
        echo "$ICON    "
elif [ $get_volume -lt 40 ]
then
        echo "$ICON$ICON   "
elif [ $get_volume -lt 60 ]
then
        echo "$ICON$ICON$ICON  "
elif [ $get_volume -lt 80 ]
then
        echo "$ICON$ICON$ICON$ICON "
else
        echo "$ICON$ICON$ICON$ICON$ICON"
fi

