cd ~/.zentag-nix-config/ || exit
git stash
nix flake update
sudo nixos-rebuild switch --flake ~/.zentag-nix-config/
git add .
git commit -m 'autoupdate'
git push origin
git stash pop
