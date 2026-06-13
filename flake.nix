# TODO: add obsidian with syncthing and nvim integration
{
  description = "My system config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
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
    inputs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    inherit (nixpkgs) lib;
  in {
    packages.x86_64-linux = {
      zvim =
        (nvf.lib.neovimConfiguration {
          inherit pkgs;
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
          ./hosts/hp-laptop
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
            };
          }
        ];
        specialArgs = {
          inherit frc;
          inherit self;
        };
      };
    };
    homeConfigurations = {
      dev = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs;};
        modules = [./home/dev.nix];
      };
    };
  };
}
