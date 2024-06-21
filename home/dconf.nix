{ pkgs, ... }:
{
  dconf = {
    enable = true;
    settings = { 
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          burn-my-windows.extensionUuid
          caffeine.extensionUuid
          clipboard-history.extensionUuid
          gsconnect.extensionUuid
          noannoyance-fork.extensionUuid
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
