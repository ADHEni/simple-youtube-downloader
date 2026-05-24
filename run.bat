@echo off
rem Enable UTF-8 encoding to correctly display Unicode characters and emojis in the console
chcp 65001 >nul
set PYTHONUTF8=1

echo ==================================================
echo             YouTube Downloader - Starter           
echo ==================================================
echo.

rem 1. Check if Python is registered in the system PATH
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python was not found on your system!
    echo Please download and install Python from https://www.python.org/
    echo Make sure to check the box "Add Python to PATH" during installation.
    echo.
    pause
    exit /b 1
)

rem 2. Check if the virtual environment exists
if not exist ".venv" (
    echo [.venv] Virtual environment does not exist. Creating...
    python -m venv .venv
    if errorlevel 1 (
        echo [ERROR] Failed to create virtual environment.
        pause
        exit /b 1
    )
    
    echo [.venv] Installing dependencies from requirements.txt...
    .venv\Scripts\pip install --upgrade pip
    .venv\Scripts\pip install -r requirements.txt
    if errorlevel 1 (
        echo [ERROR] Failed to install dependencies.
        pause
        exit /b 1
    )
    echo [.venv] Setup successfully completed!
    echo.
)

rem 3. Execute the YouTube Downloader
echo [Start] Launching YouTube Downloader...
echo.
.venv\Scripts\python youtube_downloader.py

rem 4. Prevent the console window from closing immediately
echo.
echo ==================================================
echo [Finished] Press any key to close.
echo ==================================================
pause >nul
