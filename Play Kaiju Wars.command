#!/bin/bash
# ============================================================
#  KAIJU WARS launcher — double-click this file to play!
#  It starts a tiny local web server (so the real planet
#  photos load) and opens the game in your browser.
#  Keep the little black Terminal window open while playing.
#  To stop: close that window, or press  Control + C.
# ============================================================

# Move into the folder this file lives in (works no matter where it's copied).
cd "$(dirname "$0")" || exit 1

PORT=8000
URL="http://localhost:$PORT"

echo ""
echo "  🦖  KAIJU WARS"
echo "  ----------------------------------------"

# If a server is already running on this port, just open the game.
if curl -s -o /dev/null "$URL" ; then
  echo "  Server already running — opening the game..."
  open "$URL"
  echo "  You can close this window."
  exit 0
fi

echo "  Starting the game server on port $PORT ..."

# Start the static file server in the background.
/usr/bin/python3 -m http.server "$PORT" >/dev/null 2>&1 &
SERVER_PID=$!

# Give it a moment, then open the browser.
sleep 1
open "$URL"

echo "  ✅  Game is running!  Opened: $URL"
echo ""
echo "  Keep THIS window open while playing."
echo "  Close it (or press Control + C) to stop the game."
echo "  ----------------------------------------"

# Keep the script alive so the server keeps running until the window closes.
wait $SERVER_PID
