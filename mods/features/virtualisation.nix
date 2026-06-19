{self, ...}: {
  flake.nixosModules.virtualisation = {
    imports = [
      (self.lib.hm "zen" "virtualisation")
    ];
  };
  flake.homeModules.virtualisation = {pkgs, ...}: {
    #TODO: do more stuff with it
    home.packages = with pkgs; [
      qemu
    ];
  };
}
