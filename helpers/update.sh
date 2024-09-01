olddir=$(pwd)
cd ~/.zentag-nix-config/
git stash
nix flake update
sudo nixos-rebuild switch --upgrade --flake ~/.zentag-nix-config/
home-manager switch --flake ~/.zentag-nix-config/
git add .
git commit -m 'autoupdate'
git push origin
git stash pop
cd $olddir
