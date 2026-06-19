{self, ...}: {
  flake.nixosModules.design = {
    home-manager.sharedModules = [self.homeModules.design];
  };
  flake.homeModules.design = {pkgs, ...}: {
    home.packages = with pkgs; [
      cura-appimage
      freecad
      kicad
      prusa-slicer
    ];
  };
}
