{
  programs.nixvim = {
    keymaps = [
      {
        action = "<cmd>Trouble diagnostics<CR>";
        key = "<leader>t";
      }
      {
        action = "<cmd>TodoQuickFix<CR>";
        key = "<leader>td";
      }
      {
        key = "<Tab>";
        action = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
      }
      {
        key = "<C-e>";
        action = "cmp.mapping.abort()";
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
  };
}
