alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

alias grep='grep --color=auto'
alias ag='ag --path-to-ignore ~/.agignore'

alias prettierrc='printf "trailingComma: es5\ntabWidth: 2\nsemi: true\nsingleQuote: true" > .prettierrc.yml'

alias wifi='sudo systemctl disable netctl-auto@wlp0s20f3.service && sudo wifi-menu && sudo systemctl enable netctl-auto@wlp0s20f3.service'
alias rwifi='sudo systemctl restart netctl-auto@wlp0s20f3.service'

alias myip='curl ident.me'

alias firefox='env MOZ_ENABLE_WAYLAND=1 /usr/lib/firefox/firefox' 

alias slack-cy='slack-term -config ~/.slack-term.cy'

alias imv='imv -b ffffff'

alias fk3-node='docker run -it -v "$PWD:/code" -p 3000:3000 -p 9229:9229 fk3_node'

alias fvim='nvim `fzf`'
alias fbat='bat `fzf`'

alias fiyay="yay -Slq | fzf -m --preview 'yay -Si {1}' | xargs -ro yay -S"
alias fsyay="yay -Slq | fzf -m --preview 'yay -Si {1}'"
alias fryay="yay -Qeq | fzf -m --preview 'yay -Qi {1}' | xargs -ro yay -Rs"

# alias diff="diff-so-fancy"
alias diff="colordiff"

alias ls="exa"

# Flexibla Kontoret
alias slack-fk='slack-term -config ~/.slack-term.fk'
alias fkpg="psql -h localhost -p 5432 -U developer"
alias fkenv="source ~/fkenv/bin/activate" 
