alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

alias grep='grep --color=auto'
alias ag='ag --path-to-ignore ~/.agignore'

alias prettierc='printf "trailingComma: es5\ntabWidth: 2\nsemi: true\nsingleQuote: true" > .prettierrc.yml'

alias wifi='sudo systemctl disable netctl-auto@wlp0s20f3.service && sudo wifi-menu && sudo systemctl enable netctl-auto@wlp0s20f3.service'
alias rwifi='sudo systemctl restart netctl-auto@wlp0s20f3.service'

alias myip='curl ident.me'

alias slack-fk='slack-term -config ~/.slack-term.fk'
alias slack-cy='slack-term -config ~/.slack-term.cy'
