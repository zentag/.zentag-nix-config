{
  self,
  inputs,
  ...
}: {
  flake.homeConfigurations.zen = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs {system = "x86_64-linux";};
    modules = [
      self.homeModules.zen
      {
        home.username = "USERNAME";
        home.homeDirectory = "/home/USERNAME";
      }
    ];
  };

  flake.homeModules.zen = {pkgs, ...}: {
    home.stateVersion = "24.11";
  };
}
