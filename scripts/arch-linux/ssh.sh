#!/bin/bash

# Start and enable SSH service
su -c "systemctl enable --now sshd"

# Generate SSH key
echo -e "\nGenerating SSH key for GitHub..."
ssh-keygen -t ed25519 -C "nicugorea99@gmail.com" -f "$HOME/.ssh/github"

# Add key using keychain
echo -e "\nAdding SSH key to keychain..."
eval $(keychain --eval --quiet "$HOME/.ssh/github")

# Display public key 
echo -e "\nHere's your SSH public key (add to GitHub):"
echo "https://github.com/settings/keys"
cat "$HOME/.ssh/github.pub"

# Wait for user to add key to GitHub
echo -e "\nPlease add the above public key to your GitHub account at:"
echo "https://github.com/settings/keys"
read -p "Press Enter to continue after you've added the key to GitHub..."

# Test GitHub connection
echo -e "\nTesting connection to GitHub..."
ssh -T git@github.com
