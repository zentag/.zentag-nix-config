{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.frc = {
    imports = [
      (self.lib.hm "zen" "frc")
    ];
  };
  flake.homeModules.frc = {pkgs, ...}: {
    home.packages = with inputs.frc.packages.${pkgs.stdenv.hostPlatform.system}; [
      advantagescope
      choreo
      elastic-dashboard
      sysid
      wpical
    ];
  };
}
