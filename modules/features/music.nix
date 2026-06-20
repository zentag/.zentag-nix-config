{self, ...}: {
  #TODO: add musnix
  flake.nixosModules.music = {
    imports = [
      (self.lib.hm "zen" "music")
    ];
  };
  flake.homeModules.music = {pkgs, ...}: {
    home.packages = with pkgs; [
      musescore
      reaper
    ];
  };
}
