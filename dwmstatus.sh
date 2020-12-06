#!/bin/sh

function dwmstatusbat() {
	ARG=$(cat /sys/class/power_supply/BAT0/capacity)
	state_bat=$(cat /sys/class/power_supply/BAT0/status)
	TAB_ICON=( "" "" "" "" "" )
	ICON="NOINF"
	
	if [ $state_bat = "Discharging" ]
	then
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
	else
		if [ $ARG -lt 10 ]
		then
			BLINK=$(($1%5))
		elif [ $ARG -lt 30 ]
		then
			BLINK=$(($1%4))
			BLINK=$(($BLINK+1))
		elif [ $ARG -lt 60 ]
		then
			BLINK=$(($1%3))
			BLINK=$(($BLINK+2))
		elif [ $ARG -lt 95 ]
		then 
			BLINK=$(($1%2))
			BLINK=$(($BLINK+3))
		else
			BLINK=4
		fi
		ICON=${TAB_ICON[$BLINK]}

	fi
	
	ARG=""$ARG"%"
	echo ""$ARG" "$ICON""
}

function dwmstatusmic() {
	ICON="NOMMIC"
	CMD_AMIX=$(amixer get Capture | grep off)
	if [ "$CMD_AMIX" != "" ]
	then
		ICON=""
	else
		ICON=""
	fi
	echo ""$ICON""
}

function dwmstatusmusic() {
	ICON="NOINF"
	CMD_MPC=$(mpc status | grep playing)
	if [ "$CMD_MPC" != "" ]
	then 
		ICON=""
	else
		ICON=""
	fi
	echo "MPC:"$ICON""
}

function dwmstatusmaj() {
	CMD_PAC=$(pacman -Qu | wc | cut -d ' ' -f 7)
	if [ $CMD_PAC -eq 0 ]
	then

		echo ""
	else
		echo " $CMD_PAC"
	fi
}

FRAM=0

while true
do 
	xsetroot -name "| $(dwmstatusmusic FRAM) | $(dwmstatusmic FRAM) | $(dwmstatusmaj FRAM) | $(dwmstatusbat FRAM) | $(date)|"
	sleep 0.7
	FRAM=$(($FRAM+1))
	FRAM=$(($FRAM%70))
done
