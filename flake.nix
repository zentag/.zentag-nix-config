{
  description = "My system config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    musnix.url = "github:musnix/musnix";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
    frc.url = "github:frc4451/frc-nix";
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    nvf,
    frc,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;
  in {
    packages.x86_64-linux = {
      zvim =
        (nvf.lib.neovimConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            ./nvf
          ];
        })
      .neovim;
    };
    nixosConfigurations = {
      zens-good-laptop = lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/hp
        ];
        specialArgs = {
          inherit frc;
          inherit self;
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
