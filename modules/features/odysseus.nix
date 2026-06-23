{inputs, ...}: {
  flake.nixosModules.odysseus = {
    imports = [inputs.odysseus.nixosModules.default];
    services.odysseus.enable = true;
  };
}
