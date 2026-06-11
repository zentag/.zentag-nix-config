{
  lib,
  config,
  options,
  ...
}: {
  options = {
    home = lib.mkOption {
      type = lib.types.deferredModule;
      default = {};
      description = "Alias for home configuring thanks to AlexAntonik on NixOS discourse";
    };
  };
  config = lib.mkMerge [
    {_module.args = {inherit (config) home;};}
    (lib.optionalAttrs (options ? home-manager) {
      # Only apply when home-manager is imported home-manager.users.
      home-manager.users.zen = config.home;
    })
  ];
}
