select mode in $(echo "ConfigureHM ConfigureNixos Both"); do
	nvim ~/.zentag-nix-config/
	if [ "$REPLY" = 1 ]; then
		home-manager switch --flake ~/.zentag-nix-config/
	fi
	if [ "$REPLY" = 2 ]; then
		sudo nixos-rebuild switch --upgrade --flake ~/.zentag-nix-config/

	fi
	if [ "$REPLY" = 3 ]; then
		sudo nixos-rebuild switch --upgrade --flake ~/.zentag-nix-config/
		home-manager switch --flake ~/.zentag-nix-config/
	fi
	read -rp "Name of git commit (or enter for no commit): " name
	if [ "$name" != "" ]; then
		git -C ~/.zentag-nix-config/ add .
		git -C ~/.zentag-nix-config/ commit -m "$name"
		git -C ~/.zentag-nix-config/ push origin
	fi
	source ~/.zshrc
done
