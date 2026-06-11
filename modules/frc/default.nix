{
  frc,
  pkgs,
  ...
}: let
  frcpkgs = frc.packages.${pkgs.stdenv.hostPlatform.system};
in {
  environment.systemPackages = [
    frcpkgs.advantagescope
    frcpkgs.choreo
    frcpkgs.elastic-dashboard
    frcpkgs.sysid
    frcpkgs.wpical
  ];
}
