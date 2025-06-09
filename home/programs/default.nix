{ config
, pkgs
, ...
}: {
  imports = [
    ./nixvim
    ./zsh.nix
    ./tmux.nix
  ];
}
