{pkgs, ...}: {
  # better than bash ;)
  programs.zsh.enable = true;
  home.imports = [
    ./home.nix
  ];
  users.defaultUserShell = pkgs.zsh;
}
