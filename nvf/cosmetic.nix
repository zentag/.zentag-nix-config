{
  vim = {
    # this is shown on startup if you don't provide any args
    dashboard.alpha = {
      enable = true;
      theme = "theta";
    };
    theme = {
      enable = true;
      name = "tokyonight";
      style = "moon";
      transparent = true;
    };
    # bottom bar
    statusline.lualine = {
      enable = true;
    };
    mini = {
      icons.enable = true;
      notify.enable = true;
    };
    # do current line blames and other stuff if you want
    git.gitsigns.enable = true;
  };
}
