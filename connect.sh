#!/bin/bash
# exit on non zero return
set -e
# error if unbound variable used
set -u

if [ -z "$SPEAKER_ADDRESS" ]; then
  echo "bluetooth speaker address not set!"
  exit 1
fi

CONNECTED=$(echo "info $SPEAKER_ADDRESS" | bluetoothctl 2>&1 | xargs -L 1 echo \
  | grep -e Connected: | awk '{ print $2 }')

if [ "$CONNECTED" == "yes" ]; then echo 'Already connected!' && exit 0; fi

CONN_MAX_TRY=$CONNECT_TRIALS

echo "Will try to connext $CONN_MAX_TRY time(s)..."
echo

trial=1
while true; do
  echo Attempting to connect ...
  echo "connect $SPEAKER_ADDRESS" | bluetoothctl 2>&1 | xargs -L 1 echo

  CONNECTED=$(echo "info $SPEAKER_ADDRESS" | bluetoothctl 2>&1 | xargs -L 1 echo \
    | grep -e Connected: | awk '{ print $2 }')

  if [ "$CONNECTED" == "yes" ]; then
    echo We are connected!
    break
  else
    echo Failed to connect... Push scan button on speaker?
    echo Trial \# $trial
    if [ $trial -eq $CONN_MAX_TRY ]; then
      echo Reached limit of $CONN_MAX_TRY failed connection trials
      exit 0
    fi
  fi
  let "trial += 1"
  sleep 1
done
