ICON="NOINF"
CMD_MPC=$(mpc status | grep playing)
if [ "$CMD_MPC" != "" ]
then 
	ICON=""
else
	ICON=""
fi
echo "$ICON"

case $BLOCK_BUTTON in 
	1) mpc toggle;;
	3) xterm -e ncmpcpp;;
esac
