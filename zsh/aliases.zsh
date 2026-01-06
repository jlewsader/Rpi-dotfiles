# General
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias aliases="nvim ~/.oh-my-zsh/custom/aliases.zsh"
alias cl='clear'
alias reload='source ~/.zshrc'

# Nvim
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias vdiff='nvim -d'

# ColorLS
alias ls='colorls -1'
alias la='colorls --almost-all -1'
alias lt='colorls -A --tree=2'
alias lgs='colorls -A --gs'

# Safer commands
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Misc
mk() {
  mkdir --parents "$1" && cd "$1"
}
alias rf='rm -rf'
alias sudo='sudo '  # allow aliases with sudo

# Git
alias gi='git init'
alias gb='git branch'
alias gba='git branch --all'
alias gm='git merge'
alias gn='git checkout -b'  # new branch
alias gr='git reset'
alias gu='git pull'
alias gs='git status --short'
alias ga='git add'
alias gap='git add --patch'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gco='git checkout'
alias gcl='git clone --recursive'
alias gp='git push'
alias gl='git log --all --oneline --graph --decorate -10'
alias gh='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(auto)  %D%n%s%n"'
alias gd='git difftool'
alias gds='git difftool --staged'

# tmux
alias ta='tmux attach -t'
alias tn='tmux new-session -s'
alias tl='tmux list-sessions'
alias tk='tmux kill-session -t'

# Docker
alias d='docker'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dc='docker compose'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dl='docker logs --tail=100'

# Aliases: systemd
alias sd='sudo systemctl'
alias sdu='systemctl --user'
alias jd='journalctl --no-pager'

# Power (important for iPad-powered Pi)
alias off='sudo poweroff'
