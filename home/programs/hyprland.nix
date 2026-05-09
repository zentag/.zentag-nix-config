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
  home.sessionVariables = {
    GDK_SCALE = "1.5";
    GDK_DPI_SCALE = "0.6667";
    QT_SCALE_FACTOR = "1.5";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };
}
