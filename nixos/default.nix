{ lib, ... }:
{
  imports = [
    ./configuration.nix
    ./laptop.nix
  ];
  systemd.services.wpa_supplicant.environment.OPENSSL_CONF = pkgs.writeText "openssl.cnf" ''
    openssl_conf = openssl_init
    [openssl_init]
    ssl_conf = ssl_sect
    [ssl_sect]
    system_default = system_default_sect
    [system_default_sect]
    Options = UnsafeLegacyRenegotiation
    [system_default_sect]
    CipherString = Default:@SECLEVEL=0
  '';
  options.customOpts = {
    laptop = lib.mkEnableOption "Is this device a laptop";
  };
}
