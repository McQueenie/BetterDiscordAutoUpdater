@echo off
echo Updating BetterDiscord

:: Kill Discord if running
taskkill /IM discord.exe /F

::Variables setup
set REPO_URL=https://github.com/BetterDiscord/BetterDiscord.git
set TEMP_DIR=%TEMP%\BDInstaller
::Create temporary directory
mkdir %TEMP_DIR%
cd /d %TEMP_DIR%
echo Cloning BetterDiscord repository from %REPO_URL%
git clone %REPO_URL%
cd BetterDiscord
echo Installing BetterDiscord
call pnpm install
call pnpm build
call pnpm inject
echo Completed Successfully
@REM ::Cleanup temporary directory
@REM cd /d %USERPROFILE%
@REM echo Cleaning up temporary files...
@REM rmdir /s /q %TEMP_DIR%
@REM echo Cleanup completed

:: Restart Discord
start "" "%LOCALAPPDATA%\Discord\Update.exe" --processStart Discord.exe

timeout /t 5