{
  description = "Minimal NVF flake with one example plugin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
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
      # This produces a runnable nvim
      packages.${system}.default = nvf.lib.neovimConfiguration {
        inherit pkgs;

        modules = [
          ./modules
        ];
      };
    };
}
