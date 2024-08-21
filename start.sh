#! /bin/sh
nix-shell -p git --command "git clone https://github.com/zentag/.zentag-nix-config.git"
cd .zentag-nix-config
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
nix-shell -p git --command "sudo nixos-rebuild switch --flake ."
