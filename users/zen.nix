{
  imports = [
    ../home
  ];
  home.username = "zen";
  home.homeDirectory = "/home/zen";
  customOpts = {
    pkgGroups = {
      music = true;
      office = true;
      video = true;
      programming = true;
      fun = true;
      design = true;
    };
  };
}
