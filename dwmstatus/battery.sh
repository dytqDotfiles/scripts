ARG=$(cat /sys/class/power_supply/BAT0/capacity)
state_bat=$(cat /sys/class/power_supply/BAT0/status)
TAB_ICON=( "" "" "" "" "" )
ICON="NOINF"
	
if [ $ARG -lt 10 ]
then
	ICON=${TAB_ICON[0]}
elif[ $ARG -lt 40 ] 
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

ARG=""$ARG"%"

echo "$ICON"

case $BLOCK_BUTTON in
    1) xterm ;;
esac
