{ pkgs, ... }:
{
  imports = [
    ./programs.nix
    ./dconf.nix
  ];
}
