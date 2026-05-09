{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$terminal" = "ghostty";
      "$mod" = "SUPER";
      bind = [
        "$mod, C, exec, chromium"
      ];
    };
  };
}
