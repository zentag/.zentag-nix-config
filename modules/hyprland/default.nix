{pkgs, ...}: {
  #TODO: do remote desktop
  programs.hyprland = {
    enable = true;
    # necessary for compatibility with apps that don't support the newer wayland protocol
    xwayland.enable = true;
  };
  environment.systemPackages = with pkgs; [
    hyprlauncher
    wl-clipboard
  ];
  home.imports = [
    ./home.nix
  ];
}
