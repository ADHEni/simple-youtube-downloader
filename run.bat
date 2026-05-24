@echo off
rem UTF-8-Codierung aktivieren, um Unicode-Zeichen/Emojis korrekt in der Konsole anzuzeigen
chcp 65001 >nul
set PYTHONUTF8=1

echo ==================================================
echo             YouTube Downloader - Starter           
echo ==================================================
echo.

rem 1. Pruefen, ob Python im System-PATH registriert ist
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [FEHLER] Python wurde nicht gefunden!
    echo Bitte lade dir Python von https://www.python.org/ herunter,
    echo installiere es und aktiviere dabei das Kontrollkaestchen "Add Python to PATH".
    echo.
    pause
    exit /b 1
)

rem 2. Pruefen, ob die virtuelle Umgebung venv bereits existiert
if not exist ".venv" (
    echo [.venv] Virtuelle Umgebung existiert nicht. Wird erstellt...
    python -m venv .venv
    if errorlevel 1 (
        echo [FEHLER] Konnte virtuelle Umgebung nicht erstellen.
        pause
        exit /b 1
    )
    
    echo [.venv] Installiere Abhaengigkeiten aus requirements.txt...
    .venv\Scripts\pip install --upgrade pip
    .venv\Scripts\pip install -r requirements.txt
    if errorlevel 1 (
        echo [FEHLER] Installation der Abhaengigkeiten ist fehlgeschlagen.
        pause
        exit /b 1
    )
    echo [.venv] Setup erfolgreich abgeschlossen!
    echo.
)

rem 3. Ausfuehren des YouTube Downloaders
echo [Start] Starte YouTube Downloader...
echo.
.venv\Scripts\python youtube_downloader.py

rem 4. Verhindern, dass sich das Konsolenfenster sofort schließt
echo.
echo ==================================================
echo [Beendet] Druecke eine beliebige Taste, um zu schliessen.
echo ==================================================
pause >nul
