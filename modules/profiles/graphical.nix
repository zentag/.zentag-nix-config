{self, ...}: {
  flake.nixosModules.graphical.imports = with self.nixosModules; [
    minimal
    audio
    bluetooth
    chromium
    ghostty
    hyprland
    ly
    office
    printing
    waybar
    xdg
    zsh
    zvim
  ];
}
