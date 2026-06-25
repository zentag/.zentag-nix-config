{self, ...}: {
  flake.nixosModules.terminal = {config, ...}: {
    imports = [
      (self.lib.hm config.username "terminal")
    ];
  };
  flake.homeModules.terminal = {pkgs, ...}: {
    home.packages = with pkgs; [
      bat
      bottom
      delta
      dust
      eza
      fastfetch
      fd
      fzf
      gh
      git
      glab
      pciutils
      ripgrep
      tlrc
      tree
      usbutils
      w3m
      wget
      yazi
      zoxide
    ];
  };
}
