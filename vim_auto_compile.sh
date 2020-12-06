#!/bin/sh
pkill -f "entr $HOME/.scripts/auto_compile.sh" && exit
echo "$1" | entr $HOME/.scripts/auto_compile.sh "$1"
