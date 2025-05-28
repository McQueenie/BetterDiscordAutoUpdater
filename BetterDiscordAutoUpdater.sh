#!/bin/bash

echo "Updating BetterDiscord"

# Kill Discord if running
pkill -f "Discord" 2>/dev/null

# Variables setup
REPO_URL="https://github.com/BetterDiscord/BetterDiscord.git"
FOLDER_NAME="BetterDiscord"

# Check if BetterDiscord folder exists and has .git
if [ -d "$FOLDER_NAME" ]; then
    if [ -d "$FOLDER_NAME/.git" ]; then
        echo "Found existing BetterDiscord repository, pulling latest changes..."
        cd "$FOLDER_NAME"
        git pull origin main
        if [ $? -ne 0 ]; then
            echo "Git pull failed, trying to reclone..."
            cd ..
            rm -rf "$FOLDER_NAME"
            clone_repo=true
        else
            clone_repo=false
        fi
    else
        echo "Found BetterDiscord folder but no .git, removing and cloning fresh..."
        rm -rf "$FOLDER_NAME"
        clone_repo=true
    fi
else
    clone_repo=true
fi

if [ "$clone_repo" = true ]; then
    echo "Cloning BetterDiscord repository from $REPO_URL"
    git clone --single-branch -b main "$REPO_URL"
    cd "$FOLDER_NAME"
fi

echo "Installing BetterDiscord"
pnpm install
pnpm build
pnpm inject

echo "Completed Successfully"

# Restart Discord
# For macOS, Discord is typically installed in Applications
if [ -d "/Applications/Discord.app" ]; then
    open -a Discord
else
    echo "Discord app not found in /Applications/"
    echo "Please start Discord manually"
fi

sleep 5
