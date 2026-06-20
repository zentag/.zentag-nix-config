{self, ...}: {
  flake.nixosModules.minimal.imports = with self.nixosModules; [
    networking
    boilerplate
    terminal
  ];
}
