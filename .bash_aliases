alias lsalias='grep "alias" ~/.bash_aliases'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

alias grep='grep --color=auto'
alias ag='ag --path-to-ignore ~/.agignore'

alias prettierrc='printf "trailingComma: es5\ntabWidth: 2\nsemi: true\nsingleQuote: true" > .prettierrc.yml'

alias wifi='sudo systemctl disable netctl-auto@wlp0s20f3.service && sudo wifi-menu && sudo systemctl enable netctl-auto@wlp0s20f3.service'
alias rwifi='sudo systemctl restart netctl-auto@wlp0s20f3.service'

alias ssh='TERM=vt100 ssh'
alias myip='curl ident.me'

# `time` is not installed by default on Arch even though the POSIX time command works anyway.
# Run `pacman -S time` to install `time` under `/usr/bin/time`.
# - To get default POSIX behavior - run `time -p ./my_executable` 
# - To format output - run `time -f "Memory used (kB): %M\nUser time (s): %U" ./my_executable`
# - To get verbose output - run `time -v ./my_executable`
##nofish## alias time='/usr/bin/time'
alias timestamp='date +%s%N | cut -b1-13'
alias isodate='date +"%Y-%m-%dT%H:%M:%S%z"'

alias firefox='env MOZ_ENABLE_WAYLAND=1 /usr/lib/firefox/firefox' 

alias slack-cy='slack-term -config ~/.slack-term.cy'

alias imv='imv -b ffffff'

alias fk3-node='docker run -it -v "$PWD:/code" -p 3000:3000 -p 9229:9229 fk3_node'

alias cat='bat --theme="OneHalfDark"'
alias highlight='highlight --style pablo'

alias fvim='nvim `fzf`'
alias fcat='cat `fzf`'
alias vimread='vim -M'

alias fiyay="yay -Slq | fzf -m --preview 'yay -Si {1}' | xargs -ro yay -S"
alias fsyay="yay -Slq | fzf -m --preview 'yay -Si {1}'"
alias fryay="yay -Qeq | fzf -m --preview 'yay -Qi {1}' | xargs -ro yay -Rs"

alias diff="colordiff"

alias ls="exa"

alias serve="python -m http.server"

# Flexibla Kontoret
alias fkpg="psql -h localhost -p 5432 -U developer"
alias fkenv="source ~/fkenv/bin/activate" 

alias git-rm-untracked="git stash save --keep-index --include-untracked && git stash drop"
alias gitl="git log --oneline --decorate --all --color=always"
alias gitls="git log --oneline --decorate --all --stat --color=always"

#svelte/sapper
alias sapperinit='npx degit "sveltejs/sapper-template#rollup"'
alias svelteinit='npx degit "sveltejs/template"'
alias sveltekitinit='npm init svelte@next'

#Let cmake generate clangd config
alias cmake='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON'

#mkdocs
alias mkdocs='~/.venvs/run-mkdocs.sh'
# alias wiki='pushd ${HOME}/Documents/notes && mkdocs serve & sleep 1.5 && python -mwebbrowser http://localhost:8000 && fg'
alias wiki='python -mwebbrowser http://localhost:80'
##nofish## alias mkwiki='pushd ${HOME}/Documents/notes && mkdocs build && rsync -r ./site/ /usr/share/nginx/html/ && popd'
alias mkwiki='pushd $HOME/Documents/notes && mkdocs build && rsync -r ./site/ /usr/share/nginx/html/ && popd'

alias icat='kitty +kitten icat'

alias newdeck='git clone git@github.com:jaklec/slides-template.git'

# Rust Repl
alias rusti='evcxr'

#colorize
alias go='grc go'
alias gow='grc gow'

#Use local script to launch vscode
alias code='~/.local/bin/code'
alias vimspector="echo '{\"configurations\": {\"run\": {\"adapter\":\"debugpy|vscode-go|CodeLLDB|vscode-node\",\"breakpoints\":{\"exception\":{\"all\":\"N\",\"uncaught\":\"N\"}},\"configuration\":{\"request\":\"launch\",\"protocol\":\"auto\",\"stopOnEntry\":true,\"console\":\"integratedTerminal\",\"program\":\"\${workspaceFolder\}/<<my-runnable-file>>\",\"cwd\":\"\${workspaceFolder\}\"}}}}' | jq"
alias jsconfig="echo '{\"compilerOptions\":{\"module\":\"commonjs\",\"target\":\"esnext\"},\"exclude\":[\"node_modules\"]}'"
