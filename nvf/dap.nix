{pkgs, ...}: {
  vim.debugger.nvim-dap = {
    enable = true;
    ui.enable = true;
  };
  vim.extraPlugins = with pkgs.vimPlugins; {
    virtualtext = {
      setup = "require('nvim-dap-virtual-text').setup()";
      package = nvim-dap-virtual-text;
    };
  };
}
