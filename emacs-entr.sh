#!/bin/bash

pkill -f "entr $HOME/.scripts/auto-compile.sh" && exit
# Hack emacs with $TERM
$TERM -e $(echo "$1" | entr $HOME/.scripts/auto-compile.sh "$1") 
