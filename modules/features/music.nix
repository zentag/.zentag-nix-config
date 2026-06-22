{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.music = {config, ...}: {
    imports = [
      (self.lib.hm config.username "music")
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
