{
  programs = {
    waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          output = [
            "eDP-1"
          ];
          modules-left = [
            "hyprland/workspaces"
          ];
          modules-center = [
            "clock"
          ];
          modules-right = [
            "battery"
          ];
          clock = {
            timezone = "America/Indiana/Indianapolis";
          };
        };
      };
      style = ''
        * {
                font-family: Fira Code;
        }
        window#waybar {
                background: transparent;
        }
        .modules-left,
        .modules-center,
        .modules-right {
                background-color: background;
                border-radius: 20px;
                padding: 0px 5px;
                margin: 10px 5px;
                min-height: 30px;
        }
      '';
    };
  };
}
