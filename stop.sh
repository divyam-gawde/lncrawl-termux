#!/data/data/com.termux/files/usr/bin/bash

PIDFILE="$HOME/.lncrawl-server.pid"
PORT=8181
URL="http://127.0.0.1:$PORT"

echo "=========================================="
echo "       Stopping LightNovel Crawler"
echo "=========================================="

# Nothing to stop
if [ ! -f "$PIDFILE" ]; then

    if curl -fsS --max-time 2 "$URL" >/dev/null 2>&1; then
        echo "⚠️  Server is running, but no PID file was found."
        echo "Cannot safely determine which process started it."
        echo
        echo "PID file: $PIDFILE"
        exit 1
    fi

    echo "🔴 lncrawl is already stopped."

    if command -v termux-wake-unlock >/dev/null 2>&1; then
        termux-wake-unlock
    fi

    exit 0
fi

PID="$(cat "$PIDFILE" 2>/dev/null || true)"

if [ -z "$PID" ]; then
    rm -f "$PIDFILE"
    echo "🔴 Server is stopped."
    exit 0
fi

echo "Stopping process tree..."
echo "PID: $PID"

# Kill the PRoot process and its descendants.
if kill -0 "$PID" 2>/dev/null; then
    kill "$PID" 2>/dev/null || true
fi

# Give PRoot a moment to shut down
sleep 2

# If the parent is still alive, force it
if kill -0 "$PID" 2>/dev/null; then
    echo "Force stopping..."
    kill -9 "$PID" 2>/dev/null || true
fi

rm -f "$PIDFILE"

# Release wakelock
if command -v termux-wake-unlock >/dev/null 2>&1; then
    echo "🔓 Releasing wakelock..."
    termux-wake-unlock
fi

# Verify server stopped
sleep 2

if curl -fsS --max-time 2 "$URL" >/dev/null 2>&1; then
    echo
    echo "⚠️  WARNING: Port $PORT is still responding."
    echo "The lncrawl process may still be alive."
    echo
    exit 1
fi

echo
echo "=========================================="
echo "       🔴 SERVER IS STOPPED"
echo "=========================================="
echo