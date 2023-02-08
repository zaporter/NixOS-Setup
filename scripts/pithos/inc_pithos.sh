#!/usr/bin/env zsh
PITHOS_VOLUME=$(playerctl -p io.github.Pithos volume)
if [[ "$PITHOS_VOLUME" -lt "1.2" ]]
then
    playerctl -p io.github.Pithos volume 0.1+
fi
