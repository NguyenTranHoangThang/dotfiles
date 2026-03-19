# ================================
# GIT
# ================================
alias g="git"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gpf="git push -f"
alias gl="git pull"
alias glog="git log --oneline --graph --decorate"
alias gch="git checkout"
alias gcb="git checkout -b"
alias gbm="git branch -m"
alias gd="git diff"
alias gds="git diff --staged"
alias gclean="git clean -fd"
alias gundo="git reset --soft HEAD~1"

# ================================
# DIRECTORIES
# ================================
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias -- -="cd -"

# ================================
# FILE LISTING
# ================================
alias ls="eza --icons"
alias ll="eza -lah --icons"
alias la="eza -a --icons"
alias lt="eza --tree --level=2"
alias l.="eza -a | grep '^\.'"

# ================================
# NAVIGATION
# ================================
alias z="zoxide"
alias j="z"

# ================================
# DOCKER
# ================================
alias d="docker"
alias dc="docker compose"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcl="docker compose logs"
alias dps="docker ps"
alias dpsa="docker ps -a"

# ================================
# DEVELOPMENT
# ================================
alias code="code ."
alias v="nvim"

# ================================
# SYSTEM
# ================================
alias ports="lsof -i -P -n | grep LISTEN"
alias weather="curl wttr.in"
alias ip="curl ifconfig.me"
alias c="clear"

# ================================
# QUICK SEARCH
# ================================
alias ff="fzf"
alias rg="rg --smart-case"
alias fd="fd --hidden"
