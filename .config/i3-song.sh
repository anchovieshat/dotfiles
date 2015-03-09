#!/bin/bash

SONGFILE=~/.config/i3/lastsong

# create variables
while read L; do
	k="`echo "$L" | cut -d '=' -f 1`"
	v="`echo "$L" | cut -d '=' -f 2`"
	export "$k=$v"
done < <(grep -e '^\(title\|artist\)=' /dev/stdin) # don't overwrite $1...

case "$1" in
	songstart)
		echo "$title" > $SONGFILE
		echo "$artist" >> $SONGFILE
		;;
esac
