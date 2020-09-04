#!/bin/bash
# exit non non-zero return code
set -e
HELP="Usage: $0 SPEAKER_MAC_ADDRESS MUSIC_SOURCE [VOLUME]"

SPEAKER_ADDRESS=$1
MUSIC_SOURCE=$2

if [ -z "$SPEAKER_ADDRESS" ] || [ -z "$MUSIC_SOURCE" ]; then
  echo $HELP
  exit 1
fi

MAX_CONNECT_TRIALS=3
connect.sh $SPEAKER_ADDRESS $MAX_CONNECT_TRIALS

VOLUME=$3
if [ ! -z "$VOLUME" ]; then
  amixer -q sset 'Master' $VOLUME
fi

mplayer -really-quiet $MUSIC_SOURCE
