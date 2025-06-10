{
  programs.nixvim = {
    keymaps = [
      {
        action = "<cmd>Trouble diagnostics<CR>";
        key = "<C-t>";
      }
    ];
  };
}
