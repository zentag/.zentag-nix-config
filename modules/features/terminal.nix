{self, ...}: {
  flake.nixosModules.terminal = {config, ...}: {
    imports = [
      (self.lib.hm config.username "terminal")
    ];
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
