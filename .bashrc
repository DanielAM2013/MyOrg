# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=10000
shopt -s checkwinsize
HISTTIMEFORMAT='%F %T '
export HISTCONTROL=ignoreboth:erasedups
shopt -s cmdhist
HISTIGNORE='ls:bg:fg:exit:history'
PROMPT_COMMAND='history -a; history -c; history -r'

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

git_color() {
	COLOR_RED="\033[0;31m"
	COLOR_YELLOW="\033[0;33m"
	COLOR_GREEN="\033[0;32m"
	COLOR_OCHRE="\033[38;5;95m"
	COLOR_BLUE="\033[0;34m"
	COLOR_WHITE="\033[0;37m"
	COLOR_RESET="\033[0m"
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working tree clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}


git_branch () {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo " ($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo " ($commit)"
  fi
}


if [ "$color_prompt" = yes ]; then
	PS1="${debian_chroot:+($debian_chroot)}\[\033[01;34m\][\W]\[\033[00m\]"
	PS1+="\[\$(git_color)\]"        # colors git status
	PS1+="\$(git_branch)\n"           # prints current branch
	#PS1+="\[\033[1;49;33m\]\$(parse_git_branch)\n"
	PS1+="\[\033[1;49;31m\]>> \[\033[0m\]"

else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1 -->"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#export PATH=$PATH:/usr/local/arm7/bin

#export Android=/media/steam/Android
#export PATH=$Android/tools:$Android/platform-tools:$PATH

export VimSystem="$HOME/.vim/bundle/"
export EDITOR='vim'
export SHELL='bash'

if [ "`cat /sys/class/tty/tty0/active`" == "tty7" ]
then
		[ -z $TMUX ] && exec tmux new-session 
fi

#source $HOME/$VimSystem/rosconfig.sh


# added by Anaconda2 4.4.0 installer
#export PATH="/media/steam/anaconda2/bin:$PATH"
#export PYTHON_BIN_PATH="/media/steam/anaconda2/bin/python"
#export PYTHON_LIB_PATH="/media/steam/anaconda2/lib" 
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu"
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/media/steam/anaconda2/lib/"
# export LD_LIBRARY_PATH=/media/Library/Software/DeepCL/dist/lib:$LD_LIBRARY_PATH


op () {
	# list disciplines
	#cd $HOME/Documents/Org/Estudo/Mestrado;
	cd $HOME/Documents/Org/;
	array=(*);
	for i in $(seq 0 ${#array})
	do
		echo "$i) ${array[$i]}";
	done
	read -p "Pick a number: " n;
	cd ${array[$n]}
}

self () {
	edit ~/.bashrc
}

reload () {
	source $HOME/.bashrc
}

export PATH="$VimSystem/Scripts:$PATH"
#export Software="/media/Files/Software"
#export PATH="${PATH}:$Software/SDK/tools"
#export PATH="${PATH}:$Software/SDK/tools/bin"
#export PATH="${PATH}:$Software/SDK/platform-tools"

#export PATH="${PATH}:/opt/npm-global/bin"

xload () {
	echo $(xrdb -merge ~/.Xdefault)
	echo $(xrdb -load ~/.Xdefault)
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#bind '"\e[A": history-search-backward']"'
stty -ixon

export ANDROID_HOME="/media/Files/Software/SDK"
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
