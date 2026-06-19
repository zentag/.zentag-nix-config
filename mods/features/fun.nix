{self, ...}: {
  flake.nixosModules.fun = {
    imports = [
      (self.lib.hm "zen" "fun")
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
