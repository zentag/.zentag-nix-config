{self, ...}: {
  flake.nixosModules.zvim = {pkgs, ...}: {
    imports = [
      (self.lib.hm "zen" "zvim")
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
