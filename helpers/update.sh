#!/usr/bin/env bash
cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit
cd .. || exit

git stash
nix flake update
sudo nixos-rebuild switch --flake .#"$(cat system.txt)"
git add .
git commit -m 'autoupdate'
git push origin
git stash pop
