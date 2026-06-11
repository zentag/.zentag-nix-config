{
  lib,
  config,
  ...
}: {
  options = {
    wifi.enable = lib.mkEnableOption "whether to use wifi on this machine";
  };
  config = {
    networking = {
      # use iwd for wifi (NOT wpa_supplicant or network manager)
      wireless.iwd.enable = config.wifi.enable;
    };
  };
}
