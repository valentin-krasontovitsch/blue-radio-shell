#!/bin/bash
# exit on non zero return
set -e
# error if unbound variable used
set -u

# TODO clean up output - send to /dev/null what we don't want to see
# and echo what we would like to see
if [ -z "$SPEAKER_ADDRESS" ]; then
  echo "bluetooth speaker address not set!"
  exit 1
fi

if [ -z "$MUSIC_SOURCE" ]; then
  echo "media address not set!"
  exit 1
fi

CONNECT_TRIALS=5

source ./connect.sh

DEVICE="$(amixer -D bluealsa)"

if [ -z "${DEVICE}" ]; then
  echo Device bluealsa not available
  exit 1
fi

if [ ! -z "${VOLUME}" ] || [ ! -z "${SET_VOLUME}"  ]; then
  source $SET_VOLUME $VOLUME
fi

mplayer -ao alsa:device=bluealsa $MUSIC_SOURCE
