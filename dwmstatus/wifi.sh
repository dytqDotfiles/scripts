#!/bin/sh

icon="X"

network_sts=$(nmcli radio wifi)
ping_test=$(ping -c 1 archlinux.org  | grep "paquets transmis")

if [ $network_sts == "enabled" ] 
then
	if [ -z "$ping_test" ]
	then
		icon="O"
	else
		icon=""
	fi
fi

echo "$icon"

case $BLOCK_BUTTON in
    1) nmcli radio all on  ;;
    3) nmcli radio all off ;;
esac
