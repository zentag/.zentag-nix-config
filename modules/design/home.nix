{pkgs, ...}: {
  home.packages = with pkgs; [
    cura-appimage
    freecad
    kicad
    prusa-slicer
  ];
}
