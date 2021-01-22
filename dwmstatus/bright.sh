val=$(xbacklight -get PERCENT)

if [ $val -lt 20 ]
then
	echo "    "
elif [ $val -lt 40 ]
then
	echo "   "
elif [ $val -lt 60 ]
then
	echo "  "
elif [ $val -lt 80 ]
then
	echo " "
else
	echo ""
fi
