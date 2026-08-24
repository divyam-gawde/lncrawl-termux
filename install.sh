#!/data/data/com.termux/files/usr/bin/bash

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
VENV="/root/lncrawl-env"

echo "=========================================="
echo "      LightNovel Crawler Installer"
echo "=========================================="
echo

if [ ! -d "/data/data/com.termux" ]; then
    echo "ERROR: This installer must be run from Termux."
    exit 1
fi

echo "[1/7] Updating Termux..."
pkg update -y
pkg upgrade -y

echo "[2/7] Installing required Termux packages..."
pkg install -y proot-distro curl

echo "[3/7] Checking Ubuntu..."

if proot-distro login ubuntu -- true >/dev/null 2>&1; then
    echo "Ubuntu is already installed."
else
    echo "Ubuntu is not installed."
    echo "Installing Ubuntu 24.04..."
    proot-distro install ubuntu:24.04
fi

echo "[4/7] Setting up Ubuntu..."

proot-distro login ubuntu -- bash -lc "
set -e

export DEBIAN_FRONTEND=noninteractive

apt update
apt upgrade -y

apt install -y \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    build-essential \
    curl \
    ca-certificates

if [ ! -d '$VENV' ]; then
    echo 'Creating Python environment...'
    python3 -m venv '$VENV'
else
    echo 'Python environment already exists.'
fi

source '$VENV/bin/activate'

python -m pip install --upgrade pip setuptools wheel

echo 'Installing LightNovel Crawler 4.14.0...'

python -m pip install --upgrade \
    'lightnovel-crawler==4.14.0'

echo
echo 'LightNovel Crawler version:'
lncrawl version
"

echo "[5/7] Creating command directory..."

mkdir -p "$HOME/bin"

echo "[6/7] Installing management scripts..."

cp "$REPO_DIR/start.sh" "$HOME/bin/start-lncrawl.sh"
cp "$REPO_DIR/stop.sh" "$HOME/bin/stop-lncrawl.sh"
cp "$REPO_DIR/status.sh" "$HOME/bin/status-lncrawl.sh"
cp "$REPO_DIR/update.sh" "$HOME/bin/update-lncrawl.sh"

chmod +x \
    "$HOME/bin/start-lncrawl.sh" \
    "$HOME/bin/stop-lncrawl.sh" \
    "$HOME/bin/status-lncrawl.sh" \
    "$HOME/bin/update-lncrawl.sh"

echo "[7/7] Installation complete!"

echo
echo "=========================================="
echo "          Installation Complete"
echo "=========================================="
echo
echo "Start server:"
echo "  ~/bin/start-lncrawl.sh"
echo
echo "Stop server:"
echo "  ~/bin/stop-lncrawl.sh"
echo
echo "Check status:"
echo "  ~/bin/status-lncrawl.sh"
echo
echo "Update lncrawl:"
echo "  ~/bin/update-lncrawl.sh"
echo
echo "Server:"
echo "  http://127.0.0.1:8181"
echo