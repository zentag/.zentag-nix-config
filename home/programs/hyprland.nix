{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$terminal" = "ghostty";
      "$mod" = "SUPER";
      monitor = [
        "eDP-1, 1920x1080, 0x0, 1"
      ];
      "exec-once" = [
        "[workspace 1] $terminal"
        "[workspace 3 silent] chromium"
      ];
      bind =
        [
          "$mod, S, exec, hyprlauncher"
          "$mod, C, exec, chromium"
          "$mod, Q, exec, ~/.zentag-nix-config/helpers/closewindow.sh"
          "$mod, T, exec, $terminal"
          "$mod SHIFT, S, exec, hyprshutdown --post-cmd 'shutdown -P 0'"
          "$mod SHIFT, R, exec, hyprshutdown -t 'Restarting...' --post-cmd 'reboot'"
          "$mod SHIFT, N, exec, systemctl hibernate"
          "$mod, H, movefocus, l"
          "$mod, J, movefocus, d"
          "$mod, K, movefocus, u"
          "$mod, L, movefocus, r"
          "$mod SHIFT, H, resizeactive, -10 0"
          "$mod SHIFT, J, resizeactive, 0 10"
          "$mod SHIFT, K, resizeactive, 0 -10"
          "$mod SHIFT, L, resizeactive, 10 0"
          ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
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

  home.packages = with pkgs; [
    hyprshutdown
    brightnessctl
  ];
  services = {
    hyprpaper = {
      enable = true;
      settings = {
        wallpaper = [
          {
            monitor = "eDP-1";
            path = "~/.zentag-nix-config/wallpapers/2293c8ae94f221d748111412ecf1d3.jpg";
            timeout = 60;
          }
        ];
      };
    };
    hyprsunset = {
      enable = true;
      settings = {
        profile = [
          {
            temperature = 3000;
          }
        ];
      };
    };
  };
}
