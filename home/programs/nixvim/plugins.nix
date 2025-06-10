{
  programs.nixvim = {
    plugins = {
      alpha = {
        enable = true;
        theme = "dashboard";
      };
      vim-be-good = {
        enable = true;
      };
      gitsigns = {
        enable = true;
        settings.current_line_blame = true;
      };
      mkdnflow = {
        enable = true;
        tables = {
          autoExtendCols = true;
          autoExtendRows = true;
          formatOnMove = true;
        };
      };
      neo-tree = {
        enable = true;
        filesystem.useLibuvFileWatcher = true;
      };
      telescope = {
        enable = true;
        keymaps = {
          "<leader>fg" = "live_grep";
          "<leader>f" = "find_files";
          "<leader>m" = "media_files";
        };
        extensions.media-files.enable = true;
      };
      web-devicons.enable = true;
      none-ls = {
        enable = true;
        settings = {
          cmd = [ "zsh -c nvim" ];
          debug = true;
        };
        sources = {
          code_actions = {
            statix.enable = true;
            gitsigns.enable = true;
          };
          diagnostics = {
            statix.enable = true;
            deadnix.enable = true;
            pylint.enable = true;
            checkstyle.enable = true;
          };
          formatting = {
            alejandra.enable = true;
            stylua.enable = true;
            shfmt.enable = true;
            nixpkgs_fmt.enable = true;
            prettier = {
              enable = true;
              disableTsServerFormatter = true;
            };
            black = {
              enable = true;
              settings = ''
                {
                  extra_args = { "--fast" },
                }
              '';
            };
          };
          completion = {
            luasnip.enable = true;
            spell.enable = true;
          };
        };
      };
      commentary.enable = true;
      todo-comments.enable = true;
      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          experimental = { ghost_text = true; };
          performance = {
            debounce = 60;
            fetchingTimeout = 200;
            maxViewEntries = 30;
          };
          snippet = { expand = "luasnip"; };
          formatting = { fields = [ "kind" "abbr" "menu" ]; };
          sources = [
            { name = "nvim_lsp"; }
            { name = "emoji"; }
            {
              name = "buffer"; # text within current buffer
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
              keywordLength = 3;
            }
            # { name = "copilot"; } # enable/disable copilot
            {
              name = "path"; # file system paths
              keywordLength = 3;
            }
            {
              name = "luasnip"; # snippets
              keywordLength = 3;
            }
          ];

          window = {
            completion = { border = "solid"; };
            documentation = { border = "solid"; };
          };
        };
      };
      cmp-nvim-lsp = {
        enable = true; # LSP
      };
      cmp-buffer = {
        enable = true;
      };
      cmp-path = {
        enable = true; # file system paths
      };
      cmp_luasnip = {
        enable = true; # snippets
      };
      cmp-cmdline = {
        enable = true; # autocomplete for cmdline
      };
      lspkind = {
        enable = true;
        symbolMap = {
          Copilot = "";
        };
        extraOptions = {
          maxwidth = 50;
          ellipsis_char = "...";
        };
      };
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
        };
      };
      markdown-preview = {
        enable = true;
      };
      lualine.enable = true;
      luasnip.enable = true;
      trouble = {
        enable = true;
      };
      nvim-autopairs.enable = true;
      vim-surround.enable = true;
    };
  };
}
