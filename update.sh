#!/data/data/com.termux/files/usr/bin/bash

set -e

echo "=========================================="
echo "       Updating LightNovel Crawler"
echo "=========================================="
echo

# Check Ubuntu
if [ ! -d "$PREFIX/var/lib/proot-distro/installed-rootfs/ubuntu" ]; then
    echo "❌ Ubuntu is not installed."
    echo
    echo "Run install.sh first."
    exit 1
fi

echo "Updating Ubuntu packages..."

proot-distro login ubuntu -- bash -lc '
set -e

export DEBIAN_FRONTEND=noninteractive

apt update
apt upgrade -y

source ~/lncrawl-env/bin/activate

echo
echo "Current version:"
lncrawl version

echo
echo "Updating lncrawl..."

python -m pip install --upgrade lightnovel-crawler

echo
echo "New version:"
lncrawl version
'

echo
echo "=========================================="
echo "       ✅ Update Complete"
echo "=========================================="