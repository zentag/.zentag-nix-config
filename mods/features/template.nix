{self, ...}: {
  flake.nixosModules.waybar = {
    home-manager.sharedModules = [self.homeModules.waybar];
  };
  flake.homeModules.waybar = {
  };
}
