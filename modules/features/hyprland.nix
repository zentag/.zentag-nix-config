{self, ...}: {
  flake.nixosModules.hyprland = {
    imports = [
      (self.lib.hm "zen" "hyprland")
    ];
    programs.hyprland = {
      enable = true;
      # necessary for compatibility with apps that don't support the newer wayland protocol
      xwayland.enable = true;
    };
  };
  flake.homeModules.hyprland = {
    pkgs,
    config,
    ...
  }: {
    # keyboard based navigation of windows that implements wayland
    wayland.windowManager.hyprland = {
      enable = true;
      configType = "hyprlang";
      settings = {
        "$terminal" = "ghostty";
        # modifier
        "$mod" = "SUPER";
        # for my hp laptop
        #TODO: make this change on other systems
        monitor = [
          "eDP-1, 1920x1080, 0x0, 1"
        ];
        # open the programs how I like them on startup
        "exec-once" = [
          "[workspace 1] $terminal"
          "[workspace 3 silent] chromium"
        ];
        # remove popup on startup
        "ecosystem:no_update_news" = true;
        group.groupbar.height = 0;
        # toggles waybar visibility
        bind =
          [
            "$mod, S, exec, hyprlauncher"
            "$mod, C, exec, chromium"
            "$mod, Q, exec, ${config.configDir}/helpers/closewindow.sh"
            "$mod, T, exec, $terminal"
            "$mod, W, exec, pkill waybar --signal SIGUSR1"
            "$mod SHIFT, S, exec, hyprshutdown --post-cmd 'shutdown -P 0'"
            "$mod SHIFT, R, exec, hyprshutdown -t 'Restarting...' --post-cmd 'reboot'"
            "$mod SHIFT, N, exec, systemctl hibernate"
            "$mod, H, movefocus, l"
            "$mod, J, movefocus, d"
            "$mod, K, movefocus, u"
            "$mod, L, movefocus, r"
            "$mod, N, changegroupactive, f"
            "$mod, P, changegroupactive, b"
            "$mod, G, togglegroup"
            "$mod SHIFT, H, resizeactive, -10 0"
            "$mod SHIFT, J, resizeactive, 0 10"
            "$mod SHIFT, K, resizeactive, 0 -10"
            "$mod SHIFT, L, resizeactive, 10 0"
            ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
            ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            "CTRL,2, exec, brightnessctl -e4 -n2 set 5%-"
            "CTRL,3, exec, brightnessctl -e4 -n2 set 5%+"
            ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ]
          # add the bindings inside the list below for each number 1-9
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
    # make sure we have the hyprshutdown package used for the keybindings above
    home.packages = with pkgs; [
      hyprshutdown
      hyprlauncher
      wl-clipboard
    ];
    services = {
      hyprpaper = {
        enable = true;
        settings = {
          wallpaper = [
            {
              monitor = "eDP-1";
              # setting this to a dir will cycle through wallpapers using timeout below
              path = "${config.configDir}/wallpapers/10002414.jpg";
              timeout = 60;
            }
          ];
        };
      };
      # blue light filter like redshift
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
  };
}
