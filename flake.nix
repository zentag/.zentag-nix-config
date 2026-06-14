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
    # TODO: change once upstreamed
    man-nvim.url = "github:zentag/man.nvim/0e0ab6f4ba1f6f289ba2a5c01952438c3bbcf55b";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nvf,
    frc,
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
          extraSpecialArgs = {inherit (inputs) man-nvim;};
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
