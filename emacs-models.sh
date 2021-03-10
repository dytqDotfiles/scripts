#!/bin/bash

function copy_file_models () 
{
    case $1 in
        *.tex) cp ~/.config/models/tex.template $1 ;;
        *.html) cp ~/.config/models/html.template $1 ;;
	*.troff) cp ~/.config/models/troff.template $1 ;;
	*.groff) cp ~/.config/models/groff.template $1 ;;
	*.c) cp ~/.config/models/c.template $1 ;;
        *.h) cp ~/.config/models/h.template $1 ;;
	*.cpp) cp ~/.config/models/cpp.template $1 ;;
	*.sh) cp ~/.config/models/sh.template $1 ;;
	*.py) cp ~/.config/models/py.template $1 ;;	
        *) notify-send "'$1' n'est pas compatible" ;;
    esac
}

if [ -f $1 ]
then
    copy_file_models $1
else
    notify-send "'$1' fichier invalide"
fi
