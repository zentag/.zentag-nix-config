{ pkgs, ... }: {
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          caffeine.extensionUuid
          gsconnect.extensionUuid
          tiling-assistant.extensionUuid
          vitals.extensionUuid
        ];
      };
      "org/gnome/epiphany/web" = {
        enable-webextensions = true;
      };
    };
  };
}
