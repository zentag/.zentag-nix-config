# TODO: make it not ugly
{
  programs = {
    # config for the top bar that defines modules and uses css to style
    waybar = {
      enable = true;
      settings = {
        mainBar = {
          start_hidden = true;
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
                color: white;
        }
        window#waybar {
                background: transparent;
        }
        .modules-left,
        .modules-center,
        .modules-right {
                background-color: black;
                border-radius: 20px;
                padding: 0px 5px;
                margin-top: 10px;
                margin-left: 5px;
                margin-right: 5px;
        }
        #clock {
                padding: 0 15px;
        }
      '';
    };
  };
}
