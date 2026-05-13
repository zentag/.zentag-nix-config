#!/usr/bin/env bash
# disable unused warning for mode (we use the number from $REPLY instead)
# shellcheck disable=SC2034
select mode in "Configure HM" "Configure Nixos" "Both"; do
        cd ~/.zentag-nix-config/ || exit
        ~/.zentag-nix-config/helpers/neovim.sh ~/.zentag-nix-config
        sleep 2
        while true; do
                if [ "$(hyprctl activeworkspace | head -n 1 | cut -c 14)" = "1" ]; then
                        configuring=false
                        break
                fi
        done

        git add .
        if [ "$REPLY" = 1 ]; then
                home-manager switch --flake ~/.zentag-nix-config/
        fi
        if [ "$REPLY" = 2 ]; then
                sudo nixos-rebuild switch --flake ~/.zentag-nix-config/

        fi
        if [ "$REPLY" = 3 ]; then
                sudo nixos-rebuild switch --flake ~/.zentag-nix-config/
                home-manager switch --flake ~/.zentag-nix-config/
        fi
        read -rp "Name of git commit (or enter for no commit): " name
        if [ "$name" != "" ]; then
                git -C ~/.zentag-nix-config/ commit -m "$name"
                git -C ~/.zentag-nix-config/ push origin
        fi
        # this gets rid of shellcheck warning that it can't follow the new source
        # shellcheck disable=SC1090
        source ~/.zshrc &>/dev/null
        exit
done
