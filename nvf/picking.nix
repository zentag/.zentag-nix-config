{
  pkgs,
  man-nvim,
  ...
}: {
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
      # show files that start with . (except the .git directory)
      setupOpts.pickers.find_files.find_command = ["fd" "--type" "f" "--hidden" "--exclude" ".git"];
      extensions = [
        {
          name = "fzf";
          packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
          setup = {fzf = {fuzzy = true;};};
        }
      ];
    };
    navigation.harpoon = {
      enable = true;
      # keymaps in keymaps.nix
    };

    extraPlugins = {
      man-nvim = {
        setup = "require('man_nvim').setup()";
        package = man-nvim.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
    };
  };
}
