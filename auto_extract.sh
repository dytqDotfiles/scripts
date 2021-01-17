#!/bin/sh

function extract () {
	if [ -f  $1 ];
	then
		case $1 in
			*.tar.bz2) tar xvjf $1 ;;
			*.tar.gz) tar xvzf $1 ;;
			*.rar) unrar e $1 ;;
			*.gz) gunzip $1 ;;
			*.tar) tar xvf $1 ;;
			*.tbz2) tar xvjf $1 ;;
			*.zip) unzip $1 ;;
			*.7z) 7z x $1 ;;
			*.tar.xz) tar vxf $1 ;;
			*) echo "'$1' ne peut etre extrait par extract"
		esac
	else
		echo "'$1' fichier invalide"
	fi
}

extract $1
