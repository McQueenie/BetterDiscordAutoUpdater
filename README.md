# BetterDiscord Auto-Updater Script

This is a simple batch script that automates the process of updating BetterDiscord by closing Discord, cloning the latest version from the official repository, building it, injecting it, and restarting Discord.

## Prerequisites

- [Git](https://git-scm.com/downloads)
- [Node.js](https://nodejs.org/) with [pnpm](https://pnpm.io/)
- [Bun](https://bun.sh/) (even though it's not listed officialy)

## How to Use

1. Save the script as `update-betterdiscord.bat`/`update-betterdiscord.sh`.
2. Run the script as Administrator.
3. Wait for the process to complete and Discord will restart automatically.

> **Note:** You can also add it to startup scripts to automatically update BetterDiscord on each PC launch. The cleanup section is commented out; it crashed the whole installation process, not fixed yet.

## Disclaimer

This script is unofficial and provided "as is". Use at your own risk. It was created following "Manual Installation" guide on: https://docs.betterdiscord.app/users/getting-started/installation.
