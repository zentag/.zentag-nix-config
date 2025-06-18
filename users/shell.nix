{
  imports = [
    ../home
  ];
  customOpts = {
    neovim.enable = true;
    tmux.enable = true;
    zsh.enable = true;
  };
  home.username = "zen";
  home.homeDirectory = "/home/zen";
}
