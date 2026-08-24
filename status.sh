#!/data/data/com.termux/files/usr/bin/bash

PORT=8181
URL="http://127.0.0.1:$PORT"
PIDFILE="$HOME/.lncrawl-server.pid"

echo "=========================================="
echo "       LightNovel Crawler Status"
echo "=========================================="
echo

if curl -fsS --max-time 2 "$URL" >/dev/null 2>&1; then

    echo "Status : 🟢 RUNNING"
    echo "URL    : $URL"

    if [ -f "$PIDFILE" ]; then
        PID="$(cat "$PIDFILE" 2>/dev/null || true)"

        if [ -n "$PID" ]; then
            echo "PID    : $PID"
        fi
    fi

    echo
    echo "Open:"
    echo "  $URL"

    exit 0
fi

echo "Status : 🔴 STOPPED"
echo "URL    : $URL"

if [ -f "$PIDFILE" ]; then
    echo
    echo "⚠️  Stale PID file detected:"
    cat "$PIDFILE"
fi

exit 1