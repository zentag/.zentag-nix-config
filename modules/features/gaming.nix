{self, ...}: {
  flake.nixosModules.gaming = {
    imports = [
      (self.lib.hm "zen" "gaming")
    ];
  };
  flake.homeModules.gaming = {pkgs, ...}: {
    home.packages = with pkgs; [
      discord
      prismlauncher
    ];
  };
}
