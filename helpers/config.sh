#!/usr/bin/env bash
# disable unused warning for mode (we use the number from $REPLY instead)
# shellcheck disable=SC2034
cd ~/.zentag-nix-config/ || exit
if ! hyprctl clients | grep /home/zen/.zentag-nix-config >/dev/null; then
        ~/.zentag-nix-config/helpers/neovim.sh ~/.zentag-nix-config
else
        hyprctl dispatch focuswindow title:/home/zen/.zentag-nix-config
fi
sleep 2
while true; do
        if [ "$(hyprctl activeworkspace | head -n 1 | cut -c 14)" = "1" ]; then
                configuring=false
                break
        fi
done

git add .
if ! sudo nixos-rebuild switch --flake ~/.zentag-nix-config; then
        read -rp $'\nPress enter to rerun script'
        ~/.zentag-nix-config/helpers/config.sh
        exit
fi
read -rp "Name of git commit (or enter for no commit): " name
if [ "$name" != "" ]; then
        git -C ~/.zentag-nix-config/ commit -m "$name"
        git -C ~/.zentag-nix-config/ push origin
else
        ~/.zentag-nix-config/helpers/config.sh
        exit
fi
# this gets rid of shellcheck warning that it can't follow the new source
# shellcheck disable=SC1090
source ~/.zshrc &>/dev/null
exit
