#!/usr/bin/env bash
if [ "$#" -eq 0 ]; then
        hyprctl dispatch exec "[workspace 2] ghostty --working-directory=$(pwd) -e nvim $(pwd)"
else
        hyprctl dispatch exec "[workspace 2] ghostty --working-directory=$1 -e nvim $1"
fi
