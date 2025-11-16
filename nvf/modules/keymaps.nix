{
  vim.keymaps = [
    {
      action = "<cmd>Trouble diagnostics<CR>";
      key = "<leader>t";
    }
    {
      action = "<cmd>TodoQuickFix<CR>";
      key = "<leader>td";
    }
    {
      key = "<leader>f";
      action = "<cmd>Pick files<CR>";
    }
    {
      key = "<leader>g";
      action = "<cmd>Pick live-grep<CR>";
    }
    {
      key = "<leader>e";
      action = "<cmd>lua MiniFiles.open()<CR>";
    }
  ];
}
