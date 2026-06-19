{self, ...}: {
  flake.nixosModules.virtualisation = {
    home-manager.sharedModules = [self.homeModules.virtualisation];
  };
  flake.homeModules.virtualisation = {pkgs, ...}: {
    #TODO: do more stuff with it
    home.packages = with pkgs; [
      qemu
    ];
  };
}
