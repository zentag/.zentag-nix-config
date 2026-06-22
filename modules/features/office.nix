{self, ...}: {
  flake.nixosModules.office = {config, ...}: {
    imports = [
      (self.lib.hm config.username "office")
    ];
  };
  flake.homeModules.office = {pkgs, ...}: {
    #TODO: add pdf viewers and stuff
    home.packages = with pkgs; [
      libreoffice
    ];
  };
}
