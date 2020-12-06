#!/bin/sh

msg="No new mail"

while true
do 
	mw -Y | grep "new message" && notify-send "new mail:launch mail command"
	sleep 120
done
