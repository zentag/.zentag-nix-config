{ config
, pkgs
, ...
}: {
  imports = [
    ./nixvim.nix
    ./zsh.nix
  ];
}
