#!/bin/bash
set -euo pipefail

echo "🔥 NUKING AND PAVING YOUR CONFIGURATIONS 🔥"

# Update the system first
sudo pacman -Syu --noconfirm

# Install the main packages
sudo pacman -S --noconfirm \
    stow \
    neovim \
    ripgrep \
    fzf \
    gcc \
    lazygit \
    zsh

# Nuclear Oh My Zsh installation
echo "💣 FORCE INSTALLING OH MY ZSH"
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Dotfiles
DOTFILES_REPO="git@github.com:nicugorea/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

echo "☢️ DESTROYING AND RECREATING DOTFILES"
rm -rf "$DOTFILES_DIR"
git clone "$DOTFILES_REPO" "$DOTFILES_DIR"

# Thermonuclear stow deployment
echo "💥 NUKE STOWING CONFIGS"
cd "$DOTFILES_DIR"
stow -v -R -t ~ */

# Ruthless shell enforcement
echo "🦾 FORCIBLY IMPOSING ZSH"
sudo chsh -s /bin/zsh $USER > /dev/null 2>&1

echo ""
echo "💀 CONFIGURATION ANNIHILATION COMPLETE 💀"
echo "All previous configurations have been ERADICATED"
echo "New configurations have been IMPOSED BY FORCE"
echo "Terminate all sessions and log in again to submit to zsh"
