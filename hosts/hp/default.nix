{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos
  ];
  users.users = {
    zen = {
      isNormalUser = true;
      description = "Zen Gunawardhana";
      extraGroups = [
        "networkmanager"
        "wheel"
        "audio"
        "dialout"
      ];
      packages = with pkgs; [
        firefox
        #  thunderbird
      ];
    };

  };

}
