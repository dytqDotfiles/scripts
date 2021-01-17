#!/bin/sh

PATH_APP="/usr/share/applications"
PAHT_LIST_APP=($(ls $PATH_APP/*))
NAME_APPS=$(ls $PATH_APP)

CHOSEN=$(echo -e $NAME_APPS | sed -e "s/\ /\n/g" | dmenu -i)

if ! [ -z $CHOSEN ]
then 
	EXEC=$(cat $PATH_APP/$CHOSEN | grep "Exec=" | sed -e "s/"Exec="/\ /g")
	IS_TERM=$(cat $PATH_APP/$CHOSEN | grep "Terminal=" | sed -e "s/"Terminal="/\ /g")
	if [ -z $IS_TERM ]
	then
		$EXEC
	else
		if [ $IS_TERM == 'true' ] 
		then
			$TERM $EXEC
		else
			$EXEC
		fi
	fi
fi
