{
  description = "My system config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    musnix.url = "github:musnix/musnix";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "path:./nvf";
    frc.url = "github:frc4451/frc-nix";
  };
  outputs = {
    self,
    nixpkgs,
    musnix,
    home-manager,
    nvf,
    frc,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system}.extend frc.overlays.default;
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      zens-good-laptop = lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/hp
          musnix.nixosModules.musnix
        ];
        specialArgs = {
          inherit nvf;
        };
      };
    };
    homeConfigurations = {
      zen = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./users/zen.nix
        ];
      };
      shell = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./users/shell.nix
        ];
      };
    };
  };
}
