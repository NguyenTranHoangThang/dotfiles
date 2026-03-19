# ================================
# FZF Configuration
# ================================

# Auto-completion
eval "$(fzf --zsh)"

# Key bindings
export FZF_CTRL_T_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_OPTS='--height 60% --preview "bat --style=numbers --color=always {}"'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS='--height 60% --preview "eza --tree --level=2 {}"'

# Better defaults
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border --preview "bat --style=numbers {}"'

# Preview with bat
export FZF_PREVIEW_PREVIEW_BAT_STYLE="numbers"
export FZF_PREVIEW_PREVIEW_BAT_THEME="Monokai Extended"

# Use fd instead of find
export FZF_FIND_COMMAND='fd --type f --hidden --follow --exclude .git'

# fzf-tab
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-command 'fzf'
zstyle ':fzf-tab:*' enable-discontinuous-dashboard true
