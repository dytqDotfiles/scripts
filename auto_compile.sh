#!/bin/bash

fichier="$1"
base="${fichier%.*}"

CC="gcc"
LATEXC="pdflatex"


function compile () 
{
	case $1 in
		*.tex)${LATEXC} "$1" > /dev/null 2>&1;;
		*.md) pandoc -s -o "$base".pdf "$1" ;;
		*.ms) groff -ms "$1" -T pdf > "$base".pdf ;;
		*config.h) make ;;
		*.c) ${CC} -o "$base".out "$1" ;;
		*.py) python "$1" ;;
		*) echo "'$1' n'est pas non compatible" ;;
	esac
}

if [ -f $1 ]
then
	compile $1 
else
	echo "'$1' fichier invalide"
fi

