#!/usr/bin/env zsh

set -e

DOTFILES="$HOME/.config/dotfiles"
BREWFILE="$DOTFILES/Brewfile"

echo "=========================================="
echo "  Dotfiles Installation"
echo "=========================================="

# Step 1: Prerequisites
echo "\n[1/5] Checking prerequisites..."

if ! command -v brew &>/dev/null; then
    echo "Error: Homebrew not found. Install from https://brew.sh"
    exit 1
fi

if ! command -v git &>/dev/null; then
    echo "Error: git not found"
    exit 1
fi

echo "  ✓ Homebrew found"
echo "  ✓ Git found"

# Step 2: Install Homebrew packages
echo "\n[2/5] Installing Homebrew packages..."
if [ -f "$BREWFILE" ]; then
    brew bundle --file="$BREWFILE"
    echo "  ✓ Packages installed"
else
    echo "  ! Brewfile not found, skipping"
fi

# Step 3: Install Oh My Zsh + Plugins
echo "\n[3/5] Setting up Oh My Zsh..."

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/fzf-tab" ]; then
    git clone https://github.com/Aloxaf/fzf-tab "$ZSH_CUSTOM/plugins/fzf-tab"
fi

echo "  ✓ Oh My Zsh + plugins installed"

# Step 4: Install TPM (Tmux Plugin Manager)
echo "\n[4/5] Setting up Tmux plugins..."

if command -v tmux &>/dev/null; then
    TMUX_PLUGIN_DIR="$HOME/.tmux/plugins"
    mkdir -p "$TMUX_PLUGIN_DIR"
    if [ ! -d "$TMUX_PLUGIN_DIR/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm "$TMUX_PLUGIN_DIR/tpm"
    fi
    echo "  ✓ TPM installed"
fi

# Step 5: Create symlinks
echo "\n[5/5] Creating symlinks..."
if [ -f "$DOTFILES/symlink.sh" ]; then
    bash "$DOTFILES/symlink.sh"
fi

# Copy exports template if not exists
if [ ! -f "$DOTFILES/zsh/exports.zsh" ]; then
    if [ -f "$DOTFILES/exports.zsh.template" ]; then
        cp "$DOTFILES/exports.zsh.template" "$DOTFILES/zsh/exports.zsh"
    fi
fi

echo ""
echo "=========================================="
echo "  Installation Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "  1. Restart your terminal or run: exec zsh"
echo "  2. For tmux plugins: Ctrl+a then I (capital I)"
echo "  3. Customize ~/dotfiles/zsh/exports.zsh for secrets"
echo ""
