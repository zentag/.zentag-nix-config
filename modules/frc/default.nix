{frcpkgs, ...}: {
  environment.systemPackages = [
    frcpkgs.advantagescope
    frcpkgs.choreo
    frcpkgs.elastic-dashboard
    frcpkgs.sysid
    frcpkgs.wpical
  ];
}
