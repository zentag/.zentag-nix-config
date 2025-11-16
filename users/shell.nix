{
  imports = [
    ../home
  ];
  customOpts = {
    tmux.enable = true;
    zsh.enable = true;
  };
  home.username = "zen";
  home.homeDirectory = "/home/zen";
}
