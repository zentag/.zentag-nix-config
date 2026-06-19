{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.frc = {
    home-manager.sharedModules = [self.homeModules.frc];
  };
  flake.homeModules.frc = {pkgs, ...}: {
    environment.systemPackages = with inputs.frc.packages.${pkgs.stdenv.hostPlatform.system}; [
      frcpkgs.advantagescope
      frcpkgs.choreo
      frcpkgs.elastic-dashboard
      frcpkgs.sysid
      frcpkgs.wpical
    ];
  };
}
