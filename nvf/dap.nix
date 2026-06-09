{pkgs, ...}: {
  vim = {
    # enable debugger
    debugger.nvim-dap = {
      enable = true;
    };
    # enable for each language
    languages.enableDAP = true;
    # plugin to show values of variables inline
    extraPlugins = with pkgs.vimPlugins; {
      virtualtext = {
        setup = "require('nvim-dap-virtual-text').setup()";
        package = nvim-dap-virtual-text;
      };
    };
  };
}
