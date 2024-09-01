select mode in $(echo "ConfigureHM ConfigureNixos Both"); do
	nvim ~/.zentag-nix-config/
	if [ "$REPLY" = 1 ]; then
		home-manager switch --flake ~/.zentag-nix-config/

		source ~/.zshrc
	fi
	if [ "$REPLY" = 2 ]; then
		sudo nixos-rebuild switch --upgrade --flake ~/.zentag-nix-config/

	fi
	if [ "$REPLY" = 3 ]; then
		sudo nixos-rebuild switch --upgrade --flake ~/.zentag-nix-config/
		home-manager switch --flake ~/.zentag-nix-config/
		source ~/.zshrc
	fi
	tput setaf 1
	echo 'You should git commit now!!!'
done
