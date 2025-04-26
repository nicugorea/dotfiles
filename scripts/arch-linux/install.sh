#!/bin/bash

# Install packages
su -c "pacman -Sy --noconfirm git stow neovim ripgrep fzf gcc lazygit zsh"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Remove existing dotfiles repo if it exists
if [ -d "$HOME/dotfiles" ]; then
    echo "Removing existing dotfiles repository..."
    rm -rf "$HOME/dotfiles"
fi

# Clone dotfiles repository using SSH
echo "Cloning dotfiles repository..."
git clone git@github.com:nicugorea/dotfiles.git "$HOME/dotfiles" || {
    echo "ERROR: Failed to clone repository"
    exit 1
}

# Stow all directories except 'scripts'
cd "$HOME/dotfiles" || exit
for dir in */; do
    if [ "$dir" != "scripts/" ]; then
        echo "Stowing $dir..."
        stow --adopt -v -t "$HOME" "$dir"
    fi
done

echo -e "\nSetup complete! You may need to restart your shell."
