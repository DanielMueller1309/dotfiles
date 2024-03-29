# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -lah'
#alias la='ls -A'
#alias l='ls -CF'

#own aliases

alias openpdf='okular'
alias xampp='sudo /opt/lampp/lampp &'
alias ip='ip -c'
alias onedrive_watch="watch -n1 'onedrive --display-sync-status --verbose'"
alias sonic-pi_start='sonic-pi & pasuspender -- jackd -R -d alsa -d hw:1'


#own funxtions
function bluetooth_connect {
    if [ -n "$1" ]; then
	bluetoothctl connect < bluetoothctl devices | grep "$1" | sed 's/\(Device \)\(.*\)\( '$1'\)/\2/'
    else
	echo "Usage: bluetooth_connect <realname of bluetooth device to connect>"
    fi
}
function bluetooth_disconnect {
    if [ -n "$1" ]; then
	bluetoothctl disconnect < bluetoothctl devices | grep "$1" | sed 's/\(Device \)\(.*\)\( '$1'\)/\2/'
    else
	echo "Usage: bluetooth_disconnect <realname of bluetooth device to connect>"
    fi
}


function vpn () {
    if [[ -n "$2" ]]; then
	default_wg_interface="$2"
    else
	default_wg_interface="/etc/wireguard/Acer5linuxos.conf"
    fi

    if [ "$1" == "up" ]; then
	wg-quick up $default_wg_interface
    elif  [ "$1" == "down" ]; then
	wg-quick down $default_wg_interface
    elif  [ "$1" == "new" ]; then
	wg-quick down $default_wg_interface && wg-quick up $default_wg_interface
    elif  [ "$1" == "watch" ]; then
	sudo watch -n1 -c 'unbuffer sudo wg'
    else
	echo 'Usage: vpn [up|down|new|watch] [interface file]

    Arguments:


    [option]:

    - up,		set wg up for default wg interface

    - down,		set wg down for default wg interface

    - new,		first set wg interface down than up

    - watch,		open watch programm to see wg interface stuff

    [interface file]: 	optional, if not set used default_wg_interface from bashrc function

	'
    fi
}

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

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
tmux attach -t default || tmux new -s default
fi
# PS1
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
# https://gist.github.com/justintv/168835
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
# git-symbole
# * unstaged
# + staged
# $ stashed
# % untracked
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export PS1='\[\e[32m\]\u@\[\e[32m\]\h:\[\e[94m\]\w\[\e[33m\]$(__git_ps1) \[\e[94m\]\n> \[\e[39m\]'
#\[\e[37m\]\A

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# farben fur manpages
# https://opensource.com/article/18/5/bash-tricks
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;42;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
