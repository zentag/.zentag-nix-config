{
  imports = [
    ../modules/bluetooth.nix
    ../modules/networking.nix
    ../modules/required.nix
    ../modules/graphical
  ];
  wifi.enable = true;
}
