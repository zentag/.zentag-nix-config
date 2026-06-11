{
  imports = [
    ../modules/bluetooth.nix
    ../modules/networking.nix
    ../modules/hyprland
    ../modules/zsh
  ];
  home-manager.users.zen.imports = [
    ../modules/home-only/xdg.nix
    ../modules/home-only/waybar.nix
    ../modules/home-only/ghostty.nix
    ../modules/home-only/chromium.nix
  ];
}
