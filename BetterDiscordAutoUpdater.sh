#!/bin/bash
echo "Updating BetterDiscord"

# Kill Discord if running
pkill -f Discord

# Variables setup
REPO_URL="https://github.com/BetterDiscord/BetterDiscord.git"

echo "Cloning BetterDiscord repository from $REPO_URL"
git clone --single-branch -b main $REPO_URL
cd BetterDiscord

echo "Installing BetterDiscord"
pnpm install
pnpm build
pnpm inject

echo "Completed Successfully"
# Cleanup temporary directory
# cd $HOME
# echo "Cleaning up temporary files..."
# rm -rf $TEMP_DIR
# echo "Cleanup completed"

# Restart Discord
open -a Discord

sleep 5
