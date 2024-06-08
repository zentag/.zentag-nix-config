{

  description = "My system config";

  inputs = { 
    nixpkgs.url = "nixpkgs/nixos-unstable";
    musnix.url = "github:musnix/musnix";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, musnix, home-manager, ... }: 
  let 
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      zens-good-laptop = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          musnix.nixosModules.musnix
        ];
      };
    };
    homeConfigurations = {
      zen = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
        ];
      };
      
    };
  };

}
