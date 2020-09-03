#!/bin/bash
# exit on non zero return
set -e

HELP="Usage: $0 SPEAKER_MAC_ADDRESS MUSIC_SOURCE [VOLUME]"

SPEAKER_ADDRESS=$1
MUSIC_SOURCE=$2

# TODO clean up output - send to /dev/null what we don't want to see
# and echo what we would like to see
if [ -z "$SPEAKER_ADDRESS" ] || [ -z "$MUSIC_SOURCE" ]; then
  echo $HELP
  exit 1
fi

MAX_CONNECT_TRIALS=3

connect.sh $SPEAKER_ADDRESS $MAX_CONNECT_TRIALS

VOLUME=$3
if [ ! -z "$VOLUME" ]; then
  source set_volume.sh $VOLUME
fi

mplayer $MUSIC_SOURCE
