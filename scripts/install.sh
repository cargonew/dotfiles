#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d%H%M%S)"

echo "Backing up existing configs to $BACKUP_DIR..."
mkdir -p "$BACKUP_DIR"

#Helper function to backup and symlink
link() {
    local src=$1
    local dst=$2
    if [ -e "$dst" ] || [ -L "$dst" ]; then
        echo "Backing up $dst..."
        mv "$dst" "$BACKUP_DIR/"
    fi
    echo "Linking $src -> $dst"
    ln -s "$src" "$dst"
}

#Hyprland
mkdir -p ~/.config
link "$DOTFILES/hypr" ~/.config/hypr

#Waybar
link "$DOTFILES/waybar" ~/.config/waybar

#Kitty
link "$DOTFILES/kitty" ~/.config/kitty

#Neovim(btw)
link "$DOTFILES/nvim" ~/.config/nvim

#Zsh + personal(this is my personal dir)
mkdir -p ~/.config/zsh
link "$DOTFILES/zsh" ~/.config/zsh
# Ensure home .zshrc sources .config/zsh
echo 'source $HOME/.config/zsh/.zshrc' > ~/.zshrc

#Tmux
mkdir -p ~/.config/tmux
link "$DOTFILES/tmux/.tmux.conf" ~/.config/tmux/.tmux.conf

# Optional: source oh-my-zsh if installed (if not .. you better do)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh-my-zsh not found, skipping..."
fi



echo "Dotfiles setup complete!"
echo "Backup of old configs stored in: $BACKUP_DIR"
echo "You may want to restart your terminal or run 'exec zsh'"

