{self, ...}: {
  #TODO: add musnix
  flake.nixosModules.music = {
    home-manager.sharedModules = [self.homeModules.music];
  };
  flake.homeModules.music = {pkgs, ...}: {
    home.packages = with pkgs; [
      musescore
      reaper
    ];
  };
}
