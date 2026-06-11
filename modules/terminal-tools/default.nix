{
  pkgs,
  self,
  ...
}: {
  environment.systemPackages = with pkgs; [
    bat
    btop
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
    self.packages.${pkgs.stdenv.hostPlatform.system}.zvim
    tlrc
    usbutils
    w3m
    yazi
    zoxide
  ];
}
