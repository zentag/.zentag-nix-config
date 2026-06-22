{self, ...}: {
  flake.nixosModules.fun = {config, ...}: {
    imports = [
      (self.lib.hm config.username "fun")
    ];
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
