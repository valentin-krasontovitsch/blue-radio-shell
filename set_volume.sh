#!/bin/bash
set -e
amixer -q sset 'Master' $1
