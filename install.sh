pkg update -y
pkg upgrade -y
pkg install -y proot-distro

proot-distro install ubuntu:24.04

proot-distro login ubuntu -- bash -lc '
apt update &&
apt upgrade -y &&
apt install -y python3 python3-pip python3-venv python3-dev build-essential &&
python3 -m venv ~/lncrawl-env &&
source ~/lncrawl-env/bin/activate &&
python -m pip install -U pip setuptools wheel &&
python -m pip install -U lightnovel-crawler
'

termux-wake-lock

echo
echo "======================================"
echo " Installation complete!"
echo " Starting lncrawl..."
echo "======================================"
echo

proot-distro login ubuntu -- bash -lc 'source ~/lncrawl-env/bin/activate && lncrawl -ll server --host 0.0.0.0 --port 8181'