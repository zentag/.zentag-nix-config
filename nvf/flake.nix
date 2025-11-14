{
  description = "Minimal NVF flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:NotAShelf/nvf";
  };

  outputs =
    {
      self,
      nixpkgs,
      nvf,
      ...
    }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      packages.${system}.default =
        (nvf.lib.neovimConfiguration {
          inherit pkgs;

          modules = [
            ./modules
          ];
        }).neovim;
    };
}
