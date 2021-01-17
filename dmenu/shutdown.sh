reponse=$(echo -e "Oui\nNon" | dmenu -p "Eteindre ?")

if [ $reponse = "Oui" ] 
then
	shutdown 0
fi
