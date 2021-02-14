#!/bin/sh

icon="O"

bluetooth_sts=$(bluetoothctl show | grep Powered | cut -d ' ' -f2)

if [ $bluetooth_sts == "yes" ] 
then
	icon=""
else
	icon="O"
fi

echo "$icon"

case $BLOCK_BUTTON in
    1) bluetoothctl power off;;
    3) bluetoothctl power on ;;
esac
