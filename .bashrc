#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$PATH:.local/bin

export VISUAL=nvim
export EDITOR=$VISUAL

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
