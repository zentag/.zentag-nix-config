{
  vim = {
    # gets rid of default values for keymaps - I want to set my own and not have the space polluted
    vendoredKeymaps.enable = false;
    # my <leader> is space
    keymaps = [
      {
        action = "<cmd>TodoTelescope<CR>";
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
      diagnostics = "<leader>d";
      findFiles = "<leader>f";
      liveGrep = "<leader>g";
      lspDocumentSymbols = "<leader>ds";
      lspWorkspaceSymbols = "<leader>ws";
      lspReferences = "<leader>r";
    };
  };
}
