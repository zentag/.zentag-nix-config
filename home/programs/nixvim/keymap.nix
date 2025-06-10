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
    ];
  };
}
