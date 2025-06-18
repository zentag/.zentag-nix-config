{ config, lib, ... }:
{
  options.customOpts = {
    neovim.enable = lib.mkEnableOption {
      default = true;
      description = "Use neovim";
    };
  };
  config = {
    imports = [
      ./keymap.nix
      ./plugins.nix
      ./lsp.nix
    ];
    programs.nixvim = {
      enable = true;
      opts = {
        number = true; # Show line numbers
        relativenumber = true; # Show relative line numbers
        shiftwidth = 2; # Tab width should be 2
      };
      autoCmd = [
        {
          command = "lua vim.lsp.buf.format({ async = false })";
          event = [
            "BufWritePre"
          ];
          pattern = [
            "*"
          ];
        }
        {
          command = "set nowrap";
          event = [ "BufEnter" ];
          pattern = [ "*" ];
        }
      ];
      globals.mapleader = " ";
      colorschemes.catppuccin.enable = true;
    };
  };
}
