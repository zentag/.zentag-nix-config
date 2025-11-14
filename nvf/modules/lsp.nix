{
  vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
    };
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      # Nix language and diagnostics.
      nix.enable = true;
      ts.enable = true;
    };
  };
}
