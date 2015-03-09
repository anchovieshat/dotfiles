alias ls='ls -Fh --color=always'
alias wandows_steam='WINEPREFIX="$HOME/.wine" WINEARCH="win64" wine .wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe'
alias wandows_steam32='wine .wine_32/drive_c/Program\ Files/Steam/Steam.exe'
alias gw2='wine .wine/drive_c/Program\ Files\ \(x86\)/Guild\ Wars\ 2/Gw2.exe'
godnatt() {
	echo "Godnatt, Colin!"
	sleep 3
	poweroff
}

ssh() {
	gpg-connect-agent updatestartuptty /bye >/dev/null
	/usr/bin/ssh $@
}

mosh() {
	gpg-connect-agent updatestartuptty /bye >/dev/null
	/usr/bin/mosh $@
}

git() {
	gpg-connect-agent updatestartuptty /bye >/dev/null
	/usr/bin/git $@
}
