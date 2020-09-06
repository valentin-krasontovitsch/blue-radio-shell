#!/bin/bash
# error if unbound variable used

errecho(){ >&2 echo $@; }

SPEAKER_ADDRESS=$1
if [ -z "$SPEAKER_ADDRESS" ]; then
  errecho "usage: $0 SPEAKER_MAC_ADDRESS [MAX_CONNECT_TRIALS]"
  exit 1
fi

connected.sh $SPEAKER_ADDRESS
if [ "$?" -eq "0" ]; then exit 0; fi

CONN_MAX_TRY=${2:-1}

trial=1
while true; do
  echo "connect $SPEAKER_ADDRESS" | bluetoothctl 2>&1 | xargs -L 1 echo

  connected.sh $SPEAKER_ADDRESS
  if [ "$?" -eq "0" ]; then
    break
  else
    if [ $trial -eq $CONN_MAX_TRY ]; then
      errecho Failed to connect. Speaker not ready? >&2
      exit 1
    fi
  fi
  let "trial += 1"
  sleep 1
done
