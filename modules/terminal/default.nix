{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
}
