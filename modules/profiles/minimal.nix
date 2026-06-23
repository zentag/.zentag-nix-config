{self, ...}: {
  flake.nixosModules.minimal.imports = with self.nixosModules; [
    hm
    boilerplate
    networking
    terminal
  ];
}
