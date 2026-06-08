{
  vim.keymaps = [
    {
      action = "<cmd>Trouble diagnostics<CR>";
      key = "<leader>t";
      mode = "n";
    }
    {
      action = "<cmd>TodoQuickFix<CR>";
      key = "<leader>td";
      mode = "n";
    }
    {
      key = "<leader>f";
      action = "<cmd>lua require('telescope.builtin').find_files()<CR>";
      mode = "n";
    }
    {
      key = "<leader>g";
      action = "<cmd>lua require('telescope.builtin').live_grep()<CR>";
      mode = "n";
    }
    {
      key = "<leader>ws";
      action = "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>";
      mode = "n";
    }
    {
      key = "<leader>ds";
      action = "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>";
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
}
