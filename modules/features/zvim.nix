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
  };
  flake.homeModules.zvim = {
    home.sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
