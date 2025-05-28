@echo off
echo Updating BetterDiscord

:: Kill Discord if running
taskkill /IM discord.exe /F 2>nul

:: Variables setup
set REPO_URL=https://github.com/BetterDiscord/BetterDiscord.git
set FOLDER_NAME=BetterDiscord

:: Check if BetterDiscord folder exists and has .git
if exist "%FOLDER_NAME%" (
    if exist "%FOLDER_NAME%\.git" (
        echo Found existing BetterDiscord repository, pulling latest changes...
        cd %FOLDER_NAME%
        git pull origin main
        if errorlevel 1 (
            echo Git pull failed, trying to reclone...
            cd ..
            rmdir /s /q %FOLDER_NAME%
            goto clone_repo
        )
    ) else (
        echo Found BetterDiscord folder but no .git, removing and cloning fresh...
        rmdir /s /q %FOLDER_NAME%
        goto clone_repo
    )
) else (
    :clone_repo
    echo Cloning BetterDiscord repository from %REPO_URL%
    git clone --single-branch -b main %REPO_URL%
    cd %FOLDER_NAME%
)

echo Installing BetterDiscord
call pnpm install
call pnpm build
call pnpm inject

echo Completed Successfully

@REM Cleanup temporary directory
@REM cd /d %USERPROFILE%
@REM echo Cleaning up temporary files...
@REM rmdir /s /q %TEMP_DIR%
@REM echo Cleanup completed

:: Restart Discord
start "" "%LOCALAPPDATA%\Discord\Update.exe" --processStart Discord.exe
timeout /t 5
