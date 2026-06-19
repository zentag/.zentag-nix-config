{self, ...}: {
  flake.nixosModules.waybar = {
    imports = [
      (self.lib.hm "zen" "waybar")
    ];
  };
  flake.homeModules.waybar = {
  };
}
