{ lib, ... }:
{
  imports = [
    ./configuration.nix
    ./laptop.nix
  ];
  options.customOpts = {
    laptop = lib.mkEnableOption "Is this device a laptop";
  };
}
