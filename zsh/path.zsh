# ================================
# PATH
# ================================
export PATH="$HOME/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# ================================
# LANGUAGES & VERSIONS
# ================================
# Python (pyenv)
if command -v pyenv &>/dev/null; then
  eval "$(pyenv init -)"
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
fi

# Java (sdkman)
if [ -d "$HOME/.sdkman" ]; then
  export SDKMAN_DIR="$HOME/.sdkman"
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

# ================================
# TOOL PATHS
# ================================
# Go
if [ -d "/usr/local/go/bin" ]; then
  export PATH="/usr/local/go/bin:$PATH"
fi

# Rust/Cargo
if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi
