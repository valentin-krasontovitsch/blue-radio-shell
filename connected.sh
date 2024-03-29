#!/bin/bash
# error if unbound variable used
SPEAKER_ADDRESS=$1

errecho(){ >&2 echo $@; }

if [ -z "$SPEAKER_ADDRESS" ] ; then
  errecho Usage: $0 SPEAKER_MAC_ADDRESS
  exit 1
fi

bluetoothctl info $SPEAKER_ADDRESS | grep -q 'Connected: yes'

if [ "$?" -eq "0" ]; then exit 0; else exit 1; fi
