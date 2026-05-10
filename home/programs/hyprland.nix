{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$terminal" = "ghostty";
      "$mod" = "SUPER";
      monitor = [
        "eDP-1, 1920x1080, 0x0, 1"
      ];
      "exec-once" = [
        "$terminal"
        "[workspace 2 silent] chromium"
      ];
      bind =
        [
          "$mod, S, exec, hyprlauncher"
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
  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = [
        {
          monitor = "eDP-1";
          path = "~/.zentag-nix-config/wallpapers";
          timeout = 60;
        }
      ];
    };
  };
}
