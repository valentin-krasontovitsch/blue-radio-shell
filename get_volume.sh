#!/bin/bash
set -e
VOLUME=$(amixer sget 'Master' | tail -n1 | sed -E 's/.*\[([0-9]+)%\].*/\1/')
echo $VOLUME
exit 0
