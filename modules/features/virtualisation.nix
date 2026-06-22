{self, ...}: {
  flake.nixosModules.virtualisation = {config, ...}: {
    imports = [
      (self.lib.hm config.username "virtualisation")
    ];
  };
  flake.homeModules.virtualisation = {pkgs, ...}: {
    #TODO: do more stuff with it
    home.packages = with pkgs; [
      qemu
    ];
  };
}
