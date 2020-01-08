#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$PATH:$HOME/.local/bin

export VISUAL=nvim
export EDITOR=$VISUAL

# Git
source /usr/share/git/git-prompt.sh
source /usr/share/git/completion/git-completion.bash
export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '

#determines search program for fzf
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -g ""'
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

eval "`fnm env --multi`"
