#!/bin/sh

#take a snapshot of the screen
/usr/bin/scrot /tmp/screen.png

# scale the snapshot and grey it out
/usr/bin/convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png

# scale lock icon
/usr/bin/convert $HOME/Pictures/icons/lock.png -scale 15% /tmp/lock-icon.png

# merge screens and lock-icon together
/usr/bin/convert /tmp/screen.png /tmp/lock-icon.png -fill black -colorize 25% -gravity center -composite -matte /tmp/screen.png

# launch i3lock with image create
/usr/bin/i3lock -u -i /tmp/screen.png

# cleanup
rm /tmp/screen.png /tmp/lock-icon.png
