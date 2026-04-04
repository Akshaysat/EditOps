#!/bin/bash
# ── EditOps Launcher (Mac) ──────────────────────────────────────────────

cd "$(dirname "$0")"

echo ""
echo "🎬  EditOps — Money Mediia"
echo "────────────────────────────"

# Check Python
if ! command -v python3 &>/dev/null; then
  echo "❌  Python 3 not found."
  echo "    Install it from https://www.python.org/downloads/"
  read -p "Press Enter to exit..."
  exit 1
fi

# Check ffmpeg
if ! command -v ffmpeg &>/dev/null; then
  echo "⚠️   ffmpeg not found. Installing via Homebrew..."
  if ! command -v brew &>/dev/null; then
    echo "    Homebrew not found. Install ffmpeg manually:"
    echo "    https://ffmpeg.org/download.html"
    read -p "Press Enter to exit..."
    exit 1
  fi
  brew install ffmpeg
fi

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
  echo "📦  Setting up virtual environment (first time only)..."
  python3 -m venv venv
fi

# Activate virtual environment
source venv/bin/activate

# Install / update dependencies inside the venv
echo "📦  Checking Python dependencies..."
pip install -r requirements.txt -q

# Launch app (auto-update runs inside app.py on startup)
python app.py
