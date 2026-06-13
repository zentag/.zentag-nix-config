{
  vim = {
    # gets rid of default values for keymaps - I want to set my own and not have the space polluted
    vendoredKeymaps.enable = false;
    # my <leader> is space
    keymaps = [
      {
        action = "<cmd>TodoTelescope<CR>";
        key = "<leader>t";
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
    navigation.harpoon.mappings = {
      file1 = "<C-j>";
      file2 = "<C-k>";
      file3 = "<C-l>";
      file4 = "<C-;>";
      listMarks = "<leader>h";
      markFile = "<leader>a";
    };
  };
}
