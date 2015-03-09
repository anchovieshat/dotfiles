export EDITOR="vim"
export PAGER=less
export PATH="$HOME/.local/bin:$PATH:/sbin:/usr/sbin"
export WINEARCH="win32"
export WINEPREFIX="$HOME/.wine_32"
#export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
export GPG_AGENT_INFO="asdf"

export LD="ld.gold"

gpg-connect-agent /bye
