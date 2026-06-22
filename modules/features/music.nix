{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.music = {
    imports = [
      (self.lib.hm "zen" "music")
      inputs.musnix.nixosModules.musnix
    ];
    musnix.enable = true;
  };
  flake.homeModules.music = {pkgs, ...}: {
    home.packages = with pkgs; [
      musescore
      reaper
    ];
  };
}
