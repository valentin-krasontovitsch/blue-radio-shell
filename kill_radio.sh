#!/bin/bash

PLAYER=$1

if [ -z "$PLAYER" ]; then
  echo "Usage: $0 PLAYER_PROCESS_NAME"
  exit 1
fi

set -e
set -u

PID="$(pgrep $PLAYER)"

if [ -z "$PID" ]; then
  echo $PLAYER pid not found, is it running?
  exit 1
fi

kill -9 $PID
