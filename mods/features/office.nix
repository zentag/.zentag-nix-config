{self, ...}: {
  flake.nixosModules.office = {
    home-manager.sharedModules = [self.homeModules.office];
  };
  flake.homeModules.office = {pkgs, ...}: {
    #TODO: add pdf viewers and stuff
    home.packages = with pkgs; [
      libreoffice
    ];
  };
}
