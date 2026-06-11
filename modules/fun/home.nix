{pkgs, ...}: {
  home.packages = with pkgs; [
    asciiquarium
    cbonsai
    cmatrix
    cowsay
    jp2a
    lolcat
    toipe
  ];
}
