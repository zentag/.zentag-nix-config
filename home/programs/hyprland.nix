{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$terminal" = "ghostty";
      "$mod" = "SUPER";
      bind = [
        "$mod, C, exec, chromium"
        "$mod, Q, killactive"
        "$mod, T, exec, $terminal"
      ];
    };
  };
}
