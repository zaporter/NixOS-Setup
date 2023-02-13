#!/usr/bin/env bash
nix-shell -p xorg.xmodmap
xmodmap *.map
xkbcomp :0 my-keyboard-map
exit
