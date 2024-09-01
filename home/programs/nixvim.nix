{
  programs.nixvim = {
    enable = true;
    opts = {
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers
      shiftwidth = 2; # Tab width should be 2
    };
    keymaps = [
      {
        action = "<cmd>Trouble<CR>";
        key = "<C-t>";
      }
    ];
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
    globals.mapleader = ",";
    colorschemes.catppuccin.enable = true;
    plugins = {
      alpha = {
        enable = true;
        theme = "dashboard";
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
      # Language server
      lsp = {
        enable = true;
        servers = {
          # Average webdev LSPs
          tsserver.enable = true; # TS/JS
          cssls.enable = true; # CSS
          tailwindcss.enable = true; # TailwindCSS
          html.enable = true; # HTML
          phpactor.enable = true; # PHP
          svelte.enable = false; # Svelte
          vuels.enable = false; # Vue
          pyright.enable = true; # Python
          marksman.enable = true; # Markdown
          nil-ls.enable = true; # Nix
          dockerls.enable = true; # Docker
          bashls.enable = true; # Bash
          clangd.enable = true; # C/C++
          csharp-ls.enable = true; # C#
          yamlls.enable = true; # YAML

          lua-ls = {
            # Lua
            enable = true;
            settings.telemetry.enable = false;
          };

          # Rust
          rust-analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
        };
      };
      neo-tree.enable = true;
      telescope = {
        enable = true;
        keymaps = {
          "<leader>fg" = "live_grep";
          "<leader>f" = "find_files";
          "<leader>m" = "media_files";
        };
        extensions.media-files.enable = true;
      };
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
            google_java_format.enable = false;
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

          mapping = {
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<C-e>" = "cmp.mapping.abort()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
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
      treesitter.enable = true;
      markdown-preview = {
        enable = true;
        settings.auto_start = true;
      };
      lualine.enable = true;
      luasnip.enable = true;
      trouble = {
        enable = true;
      };
      nvim-autopairs.enable = true;
      surround.enable = true;
    };
    extraConfigLua = ''
        luasnip = require("luasnip")
        kind_icons = {
          Text = "󰊄",
          Method = "",
          Function = "󰡱",
          Constructor = "",
          Field = "",
          Variable = "󱀍",
          Class = "",
          Interface = "",
          Module = "󰕳",
          Property = "",
          Unit = "",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "",
          Event = "",
          Operator = "",
          TypeParameter = "",
        } 

        local cmp = require'cmp'

        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({'/', "?" }, {
          sources = {
            { name = 'buffer' }
          }
        })

        -- Set configuration for specific filetype.
         cmp.setup.filetype('gitcommit', {
           sources = cmp.config.sources({
             { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
           }, {
             { name = 'buffer' },
           })
         })

         -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
         cmp.setup.cmdline(':', {
           sources = cmp.config.sources({
             { name = 'path' }
           }, {
             { name = 'cmdline' }
           }),
      --      formatting = {
      --       format = function(_, vim_item)
      --         vim_item.kind = cmdIcons[vim_item.kind] or "FOO"
      --       return vim_item
      --      end
      -- }
             })  '';
  };
}
