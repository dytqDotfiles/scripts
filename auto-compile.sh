#!/bin/bash

fichier="$1"
base="${fichier%.*}"

CC="gcc"


function compile () 
{
	case $1 in
		*.tex)latexmk -pdf $1 && evince "$base".pdf &;;
		*.md) pandoc -s -o "$base".pdf "$1" && evince "$base".pdf &;;
		*.ms) groff -ms "$1" -T pdf > "$base".pdf && evince "$base".pdf &;;
		*.py) python "$1" ;;
		*bashrc) source "$1" ;;
		*) notify-send "'$1' n'est pas non compatible" ;;
	esac
}

if [ -f $1 ]
then
	compile $1 
else
	notify-send  "'$1' fichier invalide"
fi
