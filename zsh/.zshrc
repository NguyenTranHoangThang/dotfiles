# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ================================
# OH MY ZSH
# ================================
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf-tab
)

source $ZSH/oh-my-zsh.sh

# ================================
# MODULAR CONFIG
# ================================
DOTFILES="$HOME/.config/dotfiles"

[ -f "$DOTFILES/zsh/path.zsh" ] && source "$DOTFILES/zsh/path.zsh"
[ -f "$DOTFILES/zsh/exports.zsh" ] && source "$DOTFILES/zsh/exports.zsh"
[ -f "$DOTFILES/zsh/aliases.zsh" ] && source "$DOTFILES/zsh/aliases.zsh"
[ -f "$DOTFILES/zsh/plugins/fzf.zsh" ] && source "$DOTFILES/zsh/plugins/fzf.zsh"

# ================================
# FNM (Node.js)
# ================================
if command -v fnm &>/dev/null; then
  eval "$(fnm env --use-on-cd)"
fi

# ================================
#
# ================================
# zoxide (smart cd)
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# ================================
# UX IMPROVEMENTS
# ================================
setopt AUTO_CD
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# Better history search
bindkey '^R' fzf-history-widget
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ================================
# PROMPT (Powerlevel10k)
# ================================
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
