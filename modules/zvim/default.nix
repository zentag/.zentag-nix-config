{
  pkgs,
  self,
  ...
}: {
  home.imports = [
    ./home.nix
  ];
  environment.systemPackages = [
    self.packages.${pkgs.stdenv.hostPlatform.system}.zvim
  ];
}
