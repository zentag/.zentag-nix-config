{
  description = "My system config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    import-tree.url = "github:vic/import-tree";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    frc.url = "github:frc4451/frc-nix";
    # TODO: change once upstreamed
    man-nvim.url = "github:zentag/man.nvim/0e0ab6f4ba1f6f289ba2a5c01952438c3bbcf55b";
  };
  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);
}
