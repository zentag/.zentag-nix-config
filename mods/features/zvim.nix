{self, ...}: {
  flake.nixosModules.zvim = {pkgs, ...}: {
    home-manager.sharedModules = [self.homeModules.zvim];
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
