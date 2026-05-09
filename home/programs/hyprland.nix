{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$terminal" = "ghostty";
      "$mod" = "SUPER";
      bind =
        [
          "$mod, C, exec, chromium"
          "$mod, Q, killactive"
          "$mod, T, exec, $terminal"
          "$mod SHIFT, S, exec, shutdown"
          "$mod SHIFT, R, exec, reboot"
          "$mod, H, movefocus, l"
          "$mod, J, movefocus, d"
          "$mod, K, movefocus, u"
          "$mod, L, movefocus, r"
        ]
        ++ (
          builtins.concatLists (builtins.genList (i: let
              workspace = i + 1;
            in [
              "$mod, ${toString workspace}, workspace, ${toString workspace}"
              "$mod SHIFT, ${toString workspace}, movetoworkspace, ${toString workspace}"
            ])
            9)
        );
    };
  };
  home.sessionVariables = {
    GDK_SCALE = "1.5";
    GDK_DPI_SCALE = "0.6667";
    QT_SCALE_FACTOR = "1.5";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };
}
