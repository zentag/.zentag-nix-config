{
  imports = [
    ./nixvim/keymap.nix
    ./nixvim/plugins.nix
  ];
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
      {
        mode = "n";
        key = "<leader>db";
        action = ":DapToggleBreakpoint<cr>";
        options = {
          silent = true;
          desc = "Toggle Breakpoint";
        };
      }
      {
        mode = "n";
        key = "<leader>dc";
        action = ":DapContinue<cr>";
        options = {
          silent = true;
          desc = "Continue";
        };
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
