alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

alias grep='grep --color=auto'
alias ag='ag --path-to-ignore ~/.agignore'

alias prettierrc='printf "trailingComma: es5\ntabWidth: 2\nsemi: true\nsingleQuote: true" > .prettierrc.yml'

alias wifi='sudo systemctl disable netctl-auto@wlp0s20f3.service && sudo wifi-menu && sudo systemctl enable netctl-auto@wlp0s20f3.service'
alias rwifi='sudo systemctl restart netctl-auto@wlp0s20f3.service'

alias myip='curl ident.me'

alias firefox='env MOZ_ENABLE_WAYLAND=1 /usr/lib/firefox/firefox' 

alias slack-fk='slack-term -config ~/.slack-term.fk'
alias slack-cy='slack-term -config ~/.slack-term.cy'

alias imv='imv -b ffffff'

alias fk3-node='docker run -it -v "$PWD:/code" -p 3000:3000 -p 9229:9229 fk3_node'

alias fvim='nvim `fzf`'
alias fbat='bat `fzf`'

# alias diff="diff-so-fancy"
alias diff="colordiff"

alias ls="exa"

alias pgfk="psql -h localhost -p 5432 -U developer"
