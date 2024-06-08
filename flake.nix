{

  description = "My system config";

  inputs = { 
    nixpkgs.url = "nixpkgs/nixos-unstable";
    musnix.url = "github:musnix/musnix";
  };
  outputs = { self, nixpkgs, musnix, ... }: 
  let 
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      zens-good-laptop = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          musnix.nixosModules.musnix
        ];
      };
    };
  };

}
