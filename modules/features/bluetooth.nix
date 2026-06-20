{
  flake.nixosModules.bluetooth = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.bluetui
    ];
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
