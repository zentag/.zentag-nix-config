{self, ...}: {
  flake.nixosModules.terminal = {
    home-manager.sharedModules = [self.homeModules.terminal];
    # searchable man
    documentation.man.cache.enable = true;
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
      usbutils
      w3m
      wget
      yazi
      zoxide
    ];
  };
}
