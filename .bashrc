. $HOME/.bashrc.d/functions
. $HOME/.bashrc.d/prompt
. $HOME/.bashrc.d/variables

if [ -f `which powerline-daemon` ]; then
	powerline-daemon -q
	POWERLINE_BASH_CONTINUATION=1
	POWERLINE_BASH_SELECT=1
	. /usr/share/powerline/bindings/bash/powerline.sh
fi
