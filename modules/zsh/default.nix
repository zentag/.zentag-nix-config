{
  imports = [
    ./nixos.nix
  ];
  # HACK: I would think this should change per machine
  home-manager.users.zen.imports = [
    ./home.nix
  ];
}
