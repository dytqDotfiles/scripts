ARG=$(cat /sys/class/power_supply/BAT0/capacity)
state_bat=$(cat /sys/class/power_supply/BAT0/status)
TAB_ICON=( "" "" "" "" "" )

ICON="NOINF"

GET_CURRENT_SEC="$(date "+%s")"

if [ $state_bat == "Discharging" ]
then
	if [ $ARG -lt 10 ]
	then
		ICON=${TAB_ICON[0]}
	elif [ $ARG -lt 40 ] 
	then
		ICON=${TAB_ICON[1]}
	elif [ $ARG -lt 60 ]
	then
		ICON=${TAB_ICON[2]}
	elif [ $ARG -lt 95 ]
	then 
		ICON=${TAB_ICON[3]}
	else
		ICON=${TAB_ICON[4]}
	fi
else
	if [ $ARG -lt 10 ]
	then
		BLINK=$(($GET_CURRENT_SEC%5))
	elif [ $ARG -lt 40 ]
	then
		BLINK=$(($GET_CURRENT_SEC%4))
		BLINK=$(($BLINK+1))
	elif [ $ARG -lt 60 ]
	then
		BLINK=$(($GET_CURRENT_SEC%3))
		BLINK=$(($BLINK+2))
	elif [ $ARG -lt 95 ]
	then 
		BLINK=$(($GET_CURRENT_SEC%2))
		BLINK=$(($BLINK+3))
	else
		BLINK=4
	fi
	ICON=${TAB_ICON[$BLINK]}
fi

echo "$ICON"

#case $BLOCK_BUTTON in
#    1) xterm ;;
#esac
