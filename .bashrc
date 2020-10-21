#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin

export VISUAL=nvim
export EDITOR=$VISUAL

# Firefox on Wayland
export MOZ_ENABLE_WAYLAND=1 
export BROWSER=firefox

# export QT_QPA_PLATFORM=wayland 

# Git
source /usr/share/git/git-prompt.sh
source /usr/share/git/completion/git-completion.bash
export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '

# Bat
export BAT_THEME="GitHub"

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

## Manage AWS user profile automatically 
PROMPT_COMMAND='[[ "${PWD##/home/jakob/Projects/jakob/}" != ${PWD} ]] && export AWS_PROFILE=jakob-cli || unset AWS_PROFILE' 

## FZF
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

#determines search program for fzf
if type rg &> /dev/null; then
  # export FZF_DEFAULT_COMMAND='ag -g ""'
  # export FZF_CTRL_T_COMMAND='ag -g ""'
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="fd -t d . $HOME"
  # export FZF_CTRL_T_COMMAND='rg --files'
fi

export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" --exclude "node_modules" --exclude ".cache" . "$1"
}

jump() {
  pushd $(fd -t d . "$HOME" | fzf)
}

eval "`fnm env --multi`"
