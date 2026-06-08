{
  vim = {
    # Gets rid of default values for keymaps - I want to set my own and not have the space polluted
    vendoredKeymaps.enable = false;
    keymaps = [
      {
        action = "<cmd>Trouble diagnostics<CR>";
        key = "<leader>td";
        mode = "n";
      }
      {
        action = "<cmd>Trouble todo<CR>";
        key = "<leader>tt";
        mode = "n";
      }
      {
        key = "<leader>e";
        action = "<cmd>lua MiniFiles.open()<CR>";
        mode = "n";
      }
      {
        key = "gd";
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
        mode = "n";
      }
    ];
    telescope.mappings = {
      findFiles = "<leader>f";
      liveGrep = "<leader>g";
      lspDocumentSymbols = "<leader>ds";
      lspWorkspaceSymbols = "<leader>ws";
      lspReferences = "<leader>r";
    };
  };
}
