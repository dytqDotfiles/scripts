while true
do
	[ "" !=  "$(mailsync -q | grep  "new message")" ] && notify-send "New message receive"
	sleep 300
done
