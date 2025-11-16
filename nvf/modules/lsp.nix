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
      nix.enable = true;
      ts.enable = true;
      astro.enable = true;
      css.enable = true;
      tailwind.enable = true;
      html.enable = true;
      markdown.enable = true;
      bash.enable = true;
      clang.enable = true;
      yaml.enable = true;
      go.enable = true;
      lua.enable = true;
      rust.enable = true;
    };
  };
}
