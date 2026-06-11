{
  programs.hyprland = {
    enable = true;
    # necessary for compatibility with apps that don't support the newer wayland protocol
    xwayland.enable = true;
  };
}
