{
  imports = [
    ./hardware-configuration.nix
    ../../default.nix
  ];
  users.users = {
    zen = {
      isNormalUser = true;
      description = "Zen Gunawardhana";
      extraGroups = [
        # sudo privileges
        "wheel"
        "audio"
        # for access to serial devices, in my case microcontrollers
        "dialout"
      ];
    };
  };
}
