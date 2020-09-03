#!/bin/bash
# error if unbound variable used
SPEAKER_ADDRESS=$1

if [ -z "$SPEAKER_ADDRESS" ] ; then
  echo Usage: $0 SPEAKER_MAC_ADDRESS
  exit 1
fi

CONNECTED=$(echo "info $SPEAKER_ADDRESS" | \
  bluetoothctl 2>&1 | \
  xargs -L 1 echo | \
  grep -e Connected: | \
  awk '{ print $2 }'
)

if [ "$CONNECTED" == "yes" ]; then exit 0; else exit 1; fi
