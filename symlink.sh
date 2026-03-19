#!/usr/bin/env zsh

set -e

DOTFILES="$HOME/.config/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

echo "=========================================="
echo "  Creating Symlinks"
echo "=========================================="

mkdir -p "$BACKUP_DIR"

backup_and_link() {
    local src="$1"
    local dest="$2"
    local dir=$(dirname "$dest")

    mkdir -p "$dir"

    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        mkdir -p "$BACKUP_DIR"
        echo "  ! Backing up existing: $dest"
        mv "$dest" "$BACKUP_DIR/"
    elif [ -L "$dest" ]; then
        echo "  - Removing old symlink: $dest"
        rm "$dest"
    fi

    echo "  → Linking: $dest → $src"
    ln -s "$src" "$dest"
}

echo "\nLinking configs...\n"

backup_and_link "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
backup_and_link "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"
backup_and_link "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

echo "\n=========================================="
echo "  Symlinks created!"
echo "=========================================="
echo "  Backup location: $BACKUP_DIR"
