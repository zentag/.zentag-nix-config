{
  imports = [
    ./hardware-configuration.nix
    ../../profiles/graphical.nix
    ../../modules/virtualisation
    ../../modules/frc
    ../../modules/tailscale
    ../../modules/ssh
  ];
  wifi.enable = true;
  system.stateVersion = "23.11"; # absolutely do not change
}
