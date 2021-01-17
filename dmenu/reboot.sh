reponse=$(echo -e "Oui\nNon" | dmenu -p "Redemarer ?")

if [ $reponse = "Oui" ] 
then
	reboot
fi
