{self, ...}: {
  flake.nixosModules.zvim = {
    config,
    pkgs,
    ...
  }: {
    imports = [
      (self.lib.hm config.username "zvim")
    ];
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.zvim
    ];
    # searchable man
    documentation.man.cache.enable = true;
  };
  flake.homeModules.zvim = {
    home.sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
