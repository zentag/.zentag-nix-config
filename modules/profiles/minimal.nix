{self, ...}: {
  flake.nixosModules.minimal.imports = with self.nixosModules; [
    boilerplate
    networking
    terminal
  ];
}
