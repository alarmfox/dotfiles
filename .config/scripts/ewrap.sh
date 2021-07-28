#!/usr/bin/env sh

if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
    # Remove option --tab for new window
    kitty @launch vim $*
else
    # tmux session running
    tmux split-window -h "vim \"$*\""
fi

