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
      action = "<cmd>Pick files<CR>";
      mode = "n";
    }
    {
      key = "<leader>g";
      action = "<cmd>Pick grep_live<CR>";
      mode = "n";
    }
    {
      key = "<leader>e";
      action = "<cmd>lua MiniFiles.open()<CR>";
      mode = "n";
    }
  ];
}
