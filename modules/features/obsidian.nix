{self, ...}: {
  flake.nixosModules.obsidian = {
    imports = [
      #TODO: make string for user an option
      (self.lib.hm "zen" "obsidian")
    ];
  };
  flake.homeModules.obsidian = {pkgs, ...}: {
    home.packages = with pkgs; [
      obsidian
    ];
    services.syncthing = {
      enable = true;
      settings = {
        devices = {
          pixel = {
            id = "VNHGMWP-QN4U5RP-NS5SWPU-TQPYPJQ-LMAM4DV-7JQRBX3-XCDOCY4-WF6QHQ2";
          };
        };
        folders = {
          "/home/zen/Documents/notes" = {
            devices = [
              "pixel"
            ];
          };
        };
      };
    };
  };
}
