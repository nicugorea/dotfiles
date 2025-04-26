#!/bin/bash

# Install required packages
su -c "pacman -S --noconfirm openssh git"

# Start and enable SSH service
su -c "systemctl enable --now sshd"

# Generate SSH key
echo -e "\nGenerating SSH key for GitHub..."
ssh-keygen -t ed25519 -C "nicugorea99@gmail.com" -f "$HOME/.ssh/github" 

# Add key to SSH agent
eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/github"

# Display public key instead of copying to clipboard
echo -e "\nHere's your SSH public key (add to GitHub):"
echo "https://github.com/settings/keys"
cat "$HOME/.ssh/github.pub"
