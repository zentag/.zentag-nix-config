{
  vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
    };
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      # Nix language and diagnostics.
      astro.enable = true;
      bash.enable = true;
      clang.enable = true;
      css.enable = true;
      go.enable = true;
      html.enable = true;
      lua.enable = true;
      markdown = {
        enable = true;
        extensions.markview-nvim.enable = true;
      };
      nix.enable = true;
      rust.enable = true;
      tailwind.enable = true;
      ts.enable = true;
      typst.enable = true;
      yaml.enable = true;
    };
  };
}
