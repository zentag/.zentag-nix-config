{
  vim = {
    # see mini-nvim readmes
    mini = {
      completion.enable = true;
      snippets.enable = true;
      surround.enable = true;
    };
    notes.obsidian = {
      enable = true;
      setupOpts = {
        workspaces = [
          {
            name = "notes";
            path = "~/Documents/notes";
          }
        ];
      };
    };
  };
}
