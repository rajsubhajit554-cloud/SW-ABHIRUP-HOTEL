@echo off
title SW ABHIRUP HOTEL - Git Update Tool
color 0B
cls

echo =======================================================
echo          SW ABHIRUP HOTEL - GIT UPDATE TOOL
echo =======================================================
echo.

:: Check if git is installed
where git >nul 2>nul
if %errorlevel% neq 0 (
    color 0C
    echo [ERROR] Git is not installed or not in system PATH.
    echo Please install Git and try again.
    goto end
)

:: Show current status
echo Current Git Status:
echo -------------------------------------------------------
git status -s
echo -------------------------------------------------------
echo.

:: Prompt to stage changes
echo Staging all changes...
git add .
echo Changes staged successfully.
echo.

:: Prompt for commit message
set /p commit_msg="Enter commit message (Press Enter for default 'Update website'): "
if "%commit_msg%"=="" set commit_msg=Update website

echo.
echo Committing changes...
git commit -m "%commit_msg%"
if %errorlevel% neq 0 (
    echo.
    echo No changes to commit or commit failed.
    goto end
)

echo.
echo Pushing changes to GitHub...
git push origin main
if %errorlevel% equ 0 (
    color 0A
    echo.
    echo =======================================================
    echo          SUCCESS: Code successfully pushed!
    echo =======================================================
) else (
    color 0C
    echo.
    echo =======================================================
    echo          FAILED: Push failed. Check your network or login.
    echo =======================================================
)

:end
echo.
echo Press any key to exit...
pause >nul
