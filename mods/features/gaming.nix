{self, ...}: {
  flake.nixosModules.gaming = {
    home-manager.sharedModules = [self.homeModules.gaming];
  };
  flake.homeModules.gaming = {pkgs, ...}: {
    home.packages = with pkgs; [
      discord
      prismlauncher
    ];
  };
}
