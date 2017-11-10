# blue-radio-shell
Some shell scripts to play music through a bluetooth speaker

## Summary

These scripts were written to facilitate an online radio alarm clock, running
on a reaspberry pi zero w with raspbian stretch, playing the music through a bluetooth speaker.

### `connect.sh`

Attempts to use `bluetoothctl` to connect to the MAC address `SPEAKER_ADDRESS`. Will try to connect `CONNECT_TRIALS` times.

### `radio.sh`

Attempts to connect using `connect.sh`, sets the volume of the `bluealsa`
device to `VOLUME` and proceeds to play the media at `MUSIC_SOURCE` using
`mplayer`.

### `set_volume_t5.sh`

Script for setting the volume using a specific control on the `blualsa` device,
with `amixer`. Couldn't figure out a good way of generalizing this one, so it's
pretty much unusable by others, but I included it for reference.

### `kill_radio.sh`

Script that takes one argument, the name of the process playing the music, and
attempts to find its PID and kill it.

## Config

Various pieces of information can be configured through environment variables,
such as:

- `SPEAKER_ADDRESS` MAC address of the bluetooth speaker (mandatory)
- `CONNECT_TRIALS` number of tries for connecting before giving up (mandatory)
- `MUSIC_SOURCE` uri to music source to be played (mandatory)
- `SET_VOLUME` command or script to set volume (optional)
- `VOLUME` set the volume (optional)

## Usage

TODO add example: cronjob!

Exemplary manual exeution of radio script:
```
sudo env SPEAKER_ADDRESS=40:3f:2d:be:c6:a2 \
MUSIC_SOURCE=https://wdr-wdr2-rheinruhr.sslcast.addradio.de/wdr/wdr2/rheinruhr/mp3/128/stream.mp3 \
SET_VOLUME=set_volume_t5.sh \
VOLUME=50% ./radio.sh
```
assuming that you're in the same folder as the scripts.

## Requirements

These scripts use the following binaries, which hence must be installed:

- `bash`
- `bluetoothctl`
- `xargs`
- `mplayer`

The scripts (without further adjustments) must be run as sudo, as we otherwise
don't have access to the bluetooth controller and what not. Could probably look
into that, to create a user that has just the needed privileges to access the
bluetooth stack.

This project has only been tested (manually) on a raspbian stretch system running on a
raspberry pi zero w.

alsa device `bluealsa`, bluez-alsa setup, ...

TODO which packages should one install to have this running?
Which steps taken to configure everything? is trusting necessary?
how about scanning, ... ?

## Known issues

TODO link to device becoming unavailable problem (seems to be related to
firmware of internal bluetooth device).
