{pkgs, ...}: {
  vim = {
    debugger.nvim-dap = {
      enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; {
      virtualtext = {
        setup = "require('nvim-dap-virtual-text').setup()";
        package = nvim-dap-virtual-text;
      };
    };
  };
}
