#!/bin/bash
set -e
amixer -q -D bluealsa sset 'Audio Pro T5 - A2DP' $1
