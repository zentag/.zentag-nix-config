{self, ...}: {
  flake.nixosModules.design = {config, ...}: {
    imports = [
      (self.lib.hm config.username "design")
    ];
  };
  flake.homeModules.design = {pkgs, ...}: {
    home.packages = with pkgs; [
      cura-appimage
      freecad
      (pkgs.kicad.override {withJava = true;})

      prusa-slicer
    ];
  };
}
