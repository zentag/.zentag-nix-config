#!/usr/bin/env bash
workspace="$(hyprctl activeworkspace | head -n 1 | cut -c 14)"
windowcount="$(hyprctl activeworkspace | grep windows | cut -c 11)"
hyprctl dispatch killactive
if [ "$workspace" = "2" ] && [ "$windowcount" = "1" ]; then
        hyprctl dispatch workspace 1
fi
