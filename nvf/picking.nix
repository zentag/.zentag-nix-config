{pkgs, ...}: {
  vim = {
    # disable netrw
    luaConfigPre = ''
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    '';
    mini = {
      files = {
        enable = true;
        setupOpts = {
          options.use_as_default_explorer = false;
        };
      };
      extra.enable = true;
    };
    telescope = {
      enable = true;
      extensions = [
        {
          name = "fzf";
          packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
          setup = {fzf = {fuzzy = true;};};
        }
      ];
    };
  };
}
