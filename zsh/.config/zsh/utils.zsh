#!/usr/bin/env zsh

# Utilities
function open-zellij-session() {
    local sessionName="$1"
    local workingDir="$2"
    local layoutName="$3"

    local fullLayoutPath="$HOME/.config/zellij/layouts/$layoutName.kdl"

    zellij attach --create "$sessionName" options --default-cwd "$workingDir" --default-layout "$fullLayoutPath"
}

function open-project() {
    local projectName="$1"
    local layoutName="$2"

    local sessionName="Project $projectName"
    local workingDir="$HOME/projects/$projectName"
    
    open-zellij-session "$sessionName" "$workingDir" "$layoutName"
}

function open-config() {
    local configName="$1"

    local sessionName="Config $configName"
    local workingDir="$HOME/dotfiles/$configName"
    
    open-zellij-session "$sessionName" "$workingDir" "config"
}
