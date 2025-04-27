#!/bin/bash

# Uncomment the desired locale in locale.gen
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen

# Generate the locale
locale-gen

# Install packages
su -c "pacman -Sy --noconfirm openssh unzip fd keychain git stow neovim ripgrep fzf gcc lazygit zsh"

# Install Volta
curl https://get.volta.sh | bash
volta install node
volta install pnpm

# Setting zsh as default shell
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Remove existing dotfiles repo if it exists
if [ -d "$HOME/dotfiles" ]; then
    echo "Removing existing dotfiles repository..."
    rm -rf "$HOME/dotfiles"
fi

# Clone dotfiles repository
echo "Cloning dotfiles repository..."
git clone https://github.com/nicugorea/dotfiles.git "$HOME/dotfiles" || {
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
