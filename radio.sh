#!/bin/bash
# exit non non-zero return code
set -e
HELP="Usage: $0 SPEAKER_MAC_ADDRESS MUSIC_SOURCE [VOLUME]"
errecho(){ >&2 echo $@; }
play(){ mplayer -really-quiet $MUSIC_SOURCE 2>/dev/null; }

SPEAKER_ADDRESS=$1
MUSIC_SOURCE=$2

if [ -z "$SPEAKER_ADDRESS" ] || [ -z "$MUSIC_SOURCE" ]; then
  errecho $HELP
  exit 1
fi

MAX_CONNECT_TRIALS=3
connect.sh $SPEAKER_ADDRESS $MAX_CONNECT_TRIALS

VOLUME=$3
if [ ! -z "$VOLUME" ]; then
  amixer -q sset 'Master' $VOLUME
fi

trap 'echo oops something went wrong, retrying; play' err INT

play
