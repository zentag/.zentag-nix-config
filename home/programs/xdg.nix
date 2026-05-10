{pkgs, ...}: {
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-termfilechooser
      ];
      config = {
        common = {
          default = "hyprland";
        };
        hyprland = {
          default = ["hyprland"];
          "org.freedesktop.impl.portal.FileChooser" = ["termfilechooser"];
          "org.freedesktop.impl.portal.OpenURI" = ["termfilechooser"];
        };
      };
    };
    configFile = {
      "xdg-desktop-portal-termfilechooser/config" = {
        force = true;
        executable = true;
        text = ''
          [filechooser]
          cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
          default_dir=$HOME/downloads
          create_help_file=1
          env=TERMCMD='kitty --title filechooser'
          env=PATH="$PATH:/run/current-system/sw/bin"
          open_mode=suggested
          save_mode=last
        '';
      };
    };
  };
}
