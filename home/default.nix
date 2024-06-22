{ pkgs, ... }:
{
  imports = [
    ./programs.nix
    ./dconf.nix
    ./services.nix
  ];
}
