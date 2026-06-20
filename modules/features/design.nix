{self, ...}: {
  flake.nixosModules.design = {
    imports = [
      (self.lib.hm "zen" "design")
    ];
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
