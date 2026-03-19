# Dotfiles

Portable macOS development environment setup.

## Quick Start

```bash
git clone <your-repo-url> ~/.config/dotfiles
cd ~/.config/dotfiles
./install.sh
```

## What's Included

| Tool | Config | Description |
|------|--------|-------------|
| zsh | `zsh/.zshrc` | Oh My Zsh + Powerlevel10k + plugins |
| git | `git/.gitconfig` | Aliases & settings |
| tmux | `tmux/.tmux.conf` | Terminal multiplexer |
| fzf | `zsh/plugins/fzf.zsh` | Fuzzy finder integration |

## Modern CLI Tools

- **eza** - Modern `ls` replacement
- **bat** - Modern `cat` replacement
- **ripgrep** - Fast grep alternative
- **fd** - Fast `find` alternative
- **zoxide** - Smart `cd` with learning
- **fzf** - Fuzzy finder

## Version Managers

- **fnm** - Node.js version manager
- **pyenv** - Python version manager
- **sdkman** - Java/Scala version manager

## Folder Structure

```
.dotfiles/
├── install.sh          # One-command bootstrap
├── Brewfile            # Homebrew dependencies
├── symlink.sh          # Symlink creation
├── zsh/
│   ├── .zshrc
│   ├── aliases.zsh
│   ├── exports.zsh
│   ├── path.zsh
│   └── plugins/
│       └── fzf.zsh
├── git/
│   └── .gitconfig
└── tmux/
    └── .tmux.conf
```

## Customization

### Adding Secrets

```bash
cp exports.zsh.template exports.zsh
# Edit exports.zsh with your API keys
```

### Adding Aliases

Edit `zsh/aliases.zsh` with your custom aliases.

## Troubleshooting

### Re-run installation
```bash
cd ~/.config/dotfiles && ./install.sh
```

### Manual symlink
```bash
cd ~/.config/dotfiles && ./symlink.sh
```

### Check loaded config
```bash
zsh -x -v 2>&1 | less
```
