{self, ...}: {
  flake.nixosModules.office = {
    imports = [
      (self.lib.hm "zen" "office")
    ];
  };
  flake.homeModules.office = {pkgs, ...}: {
    #TODO: add pdf viewers and stuff
    home.packages = with pkgs; [
      libreoffice
    ];
  };
}
