while true
do
	$HOME/.config/myhud/generate.sh
	feh --bg-center $HOME/.config/myhud/out/res.png
	sleep 10
done
