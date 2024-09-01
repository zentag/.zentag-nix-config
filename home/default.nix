{ pkgs, ... }: {
  imports = [
    ./programs
    ./dconf.nix
    ./services.nix
  ];
}
