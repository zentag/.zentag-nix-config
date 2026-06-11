{pkgs, ...}: {
  home.packages = with pkgs; [
    musescore
    reaper
  ];
}
