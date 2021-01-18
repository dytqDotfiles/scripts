ICON="NOMMIC"
CMD_AMIX=$(amixer get Capture | grep off)
if [ "$CMD_AMIX" != "" ]
then
	ICON=""
else
	ICON=""
fi
echo ""$ICON""

case $BLOCK_BUTTON in
	1) amixer set Capture toggle ;;
	3) xterm -e alsamixer ;;
esac
