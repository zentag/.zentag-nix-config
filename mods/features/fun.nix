{self, ...}: {
  flake.nixosModules.fun = {
    home-manager.sharedModules = [self.homeModules.fun];
  };
  flake.homeModules.fun = {pkgs, ...}: {
    home.packages = with pkgs; [
      asciiquarium
      cbonsai
      cmatrix
      cowsay
      jp2a
      lolcat
      toipe
    ];
  };
}
