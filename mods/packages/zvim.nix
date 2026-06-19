{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.zvim =
      (inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit (inputs) man-nvim;};
        modules = [
          ../../nvf
        ];
      })
      .neovim;
  };
}
