{
  flake.nixosModules.ssh = {
    services.openssh = {
      enable = true;
      ports = [22];
      settings = {
        PasswordAuthentication = true;
        AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
        UseDns = true;
        PermitRootLogin = "prohibit-password";
      };
    };
  };
}
