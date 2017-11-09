# blue-radio-shell
some shell scripts to run a radio through a bluetooth speaker

## Summary

These scripts were written to facilitate an online radio alarm clock, running
on a reaspberry pi zero w with raspbian stretch, playing the music through a bluetooth speaker.

## Config

Various pieces of information can be configured through environment variables,
such as:

- `SPEAKER_ADDRESS` MAC address of the bluetooth speaker (mandatory)
- `CONNECT_TRIALS` number of tries for connecting before giving up (mandatory)


## Usage

TODO describe

## Requirements

These scripts use the following binaries, which hence must be installed:

- `bash`
- `bluetoothctl`
- `xargs`

The scripts (without further adjustments) must be run as sudo, as we otherwise
don't have access to the bluetooth controller and what not.

They've only been tested (manually) on a raspbian stretch system running on a
raspberry pi zero w.

TODO which packages should one install to have this running?
Which steps taken to configure everything? is trusting necessary?
how about scanning, ... ?

## Known issues

TODO link to device becoming unavailable problem (seems to be related to
firmware of internal bluetooth device).
