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

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --all --oneline --graph --decorate'
alias gh='git log --pretty=format:"[%h] %ae, %ar: %s" --stat'
alias gd='git difftool'

# tmux
alias ta='tmux attach -t main'
alias tn='tmux new -s main'
alias t='tmux'
alias tls='tmux list-sessions'
alias tk='tmux kill-session -t main'

# Docker
alias d='docker'
alias dc='docker compose'
alias dcu='docker compose up'
alias dcd='docker compose down'

# Power (important for iPad-powered Pi)
alias off='sudo poweroff'
