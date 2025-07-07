{ lib, config, ... }:
let
  cfg = config.customOpts;
in
{
  powerManagement.powertop.enable = lib.mkIf cfg.laptop true;
}
