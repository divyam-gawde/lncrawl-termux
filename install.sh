#!/data/data/com.termux/files/usr/bin/bash

set -e

PIDFILE="$HOME/.lncrawl-server.pid"
LOGFILE="$HOME/.lncrawl-server.log"
PORT=8181
URL="http://127.0.0.1:$PORT"

echo "=========================================="
echo "       Starting LightNovel Crawler"
echo "=========================================="

# Check whether server is already responding
if curl -fsS --max-time 2 "$URL" >/dev/null 2>&1; then
    echo
    echo "🟢 lncrawl is already running."
    echo
    echo "URL: $URL"
    exit 0
fi

# Remove stale PID file
if [ -f "$PIDFILE" ]; then
    OLD_PID="$(cat "$PIDFILE" 2>/dev/null || true)"

    if [ -n "$OLD_PID" ] && kill -0 "$OLD_PID" 2>/dev/null; then
        echo "⚠️ A previous lncrawl process appears to be running."
        echo "PID: $OLD_PID"
        exit 1
    fi

    rm -f "$PIDFILE"
fi

echo "🔒 Acquiring wakelock..."

if command -v termux-wake-lock >/dev/null 2>&1; then
    termux-wake-lock
else
    echo "⚠️ termux-wake-lock is not available."
    echo "   Server will still start."
fi

echo "🚀 Starting Ubuntu + lncrawl..."

# Make sure the log file can be created
touch "$LOGFILE"

proot-distro login ubuntu -- bash -lc '
source ~/lncrawl-env/bin/activate
exec lncrawl -ll server --host 0.0.0.0 --port 8181
' >"$LOGFILE" 2>&1 &

PID=$!

echo "$PID" > "$PIDFILE"

echo "PID: $PID"
echo "Log: $LOGFILE"
echo "Waiting for server..."

# Wait up to 60 seconds
for i in $(seq 1 60); do

    if curl -fsS --max-time 1 "$URL" >/dev/null 2>&1; then
        echo
        echo "=========================================="
        echo "       🟢 SERVER IS RUNNING"
        echo "=========================================="
        echo
        echo "URL: $URL"
        echo "PID: $PID"
        echo "Log: $LOGFILE"
        echo
        exit 0
    fi

    if ! kill -0 "$PID" 2>/dev/null; then
        echo
        echo "❌ lncrawl failed to start."
        echo
        echo "Last log output:"
        if [ -f "$LOGFILE" ]; then
            tail -n 30 "$LOGFILE"
        else
            echo "Log file was not created."
        fi

        rm -f "$PIDFILE"

        if command -v termux-wake-unlock >/dev/null 2>&1; then
            termux-wake-unlock
        fi

        exit 1
    fi

    printf "\r⏳ Starting... %2d/60" "$i"
    sleep 1
done

echo
echo
echo "❌ Server did not respond within 60 seconds."
echo
echo "Last log output:"

if [ -f "$LOGFILE" ]; then
    tail -n 30 "$LOGFILE"
else
    echo "Log file was not created."
fi

exit 1