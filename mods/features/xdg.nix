{self, ...}: {
  flake.nixosModules.xdg = {
    home-manager.sharedModules = [self.homeModules.xdg];
  };
  flake.homeModules.xdg = {
    pkgs,
    lib,
    ...
  }: {
    # TODO: somehow this is broken ???
    # all of this is to make sure I can open stuff like links and file downloads in their correct programs
    home.activation.createPortalDirs = lib.hm.dag.entryAfter ["writeBoundary"] ''
      mkdir -p $HOME/.local/state/xdg-desktop-portal-termfilechooser
      if [ ! -s $HOME/.local/state/xdg-desktop-portal-termfilechooser/last_dir ]; then
        echo "$HOME" > $HOME/.local/state/xdg-desktop-portal-termfilechooser/last_dir
      fi
    '';
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
            default = ["hyprland"];
            "org.freedesktop.impl.portal.FileChooser" = ["termfilechooser"];
          };
        };
      };
      configFile = {
        "xdg-desktop-portal-termfilechooser/config" = {
          force = true;
          executable = true;
          # cmd=........ sets the program to use as filechooser (that runs in terminal)
          text = ''
            [filechooser]
            cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
            default_dir=$HOME/downloads
            create_help_file=1
            env=TERMCMD='ghostty --title="filechooser" -e'
            env=PATH="$PATH:/run/current-system/sw/bin"
            open_mode=suggested
            save_mode=last
          '';
        };
      };
    };
  };
}
