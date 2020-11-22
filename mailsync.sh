#!/bin/sh

msg="No new mail"

while true
do 
	sleep 120
	mw -Y | grep "new message" && notify-send "new mail:launch mail command"
done
