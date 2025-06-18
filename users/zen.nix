{
  imports = [
    ../home
  ];
  home.username = "zen";
  home.homeDirectory = "/home/zen";
  customOpts = {
    gnome.enable = true;
    neovim.enable = true;
    zsh.enable = true;
    tmux.enable = true;
  };
}
