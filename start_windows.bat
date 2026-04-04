@echo off
REM ── EditOps Launcher (Windows) ─────────────────────────────────────────

cd /d "%~dp0"

echo.
echo  EditOps -- Money Mediia
echo  -------------------------

REM Check Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo  [ERROR] Python not found.
    echo  Install it from https://www.python.org/downloads/
    echo  Make sure to check "Add Python to PATH" during install.
    pause
    exit /b
)

REM Check ffmpeg
ffmpeg -version >nul 2>&1
if %errorlevel% neq 0 (
    echo  [WARNING] ffmpeg not found in PATH.
    echo  Download from: https://ffmpeg.org/download.html
    echo  Extract and add the "bin" folder to your system PATH.
    pause
    exit /b
)

REM Install Python deps
echo  Checking Python dependencies...
python -m pip install -r requirements.txt -q

echo.
echo  Starting server...
echo  Open your browser and go to: http://localhost:5000
echo  Press Ctrl+C to stop the server.
echo.

python app.py
pause
