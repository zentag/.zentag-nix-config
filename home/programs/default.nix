{ config
, pkgs
, ...
}: {
  imports = [
    ./nixvim.nix
    ./zsh.nix
    ./tmux.nix
  ];
}
