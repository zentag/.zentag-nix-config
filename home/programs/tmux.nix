{
  config,
  pkgs,
  lib,
  ...
}:
{
  options.customOpts = {
    tmux.enable = lib.mkEnableOption {
      default = true;
      description = "use tmux";
    };
  };
  config = {
    programs.tmux = {
      enable = true;
      aggressiveResize = true;
      baseIndex = 1;
      newSession = true;
      # Stop tmux+escape craziness.
      escapeTime = 0;
      # Force tmux to use /tmp for sockets (WSL2 compat)
      secureSocket = false;
      keyMode = "vi";
      plugins = with pkgs; [
        tmuxPlugins.better-mouse-mode
        tmuxPlugins.yank
        tmuxPlugins.catppuccin
      ];

      extraConfig = ''
        # Set shell to zsh
        set -g default-shell /run/current-system/sw/bin/zsh

        # Set Prefix
        unbind C-b
        set-option -g prefix C-a
        bind-key C-a send-prefix

        # Cool trick: Let's dim out any pane that's not active.
        set-window-option -g window-style fg=white,bg=colour234
        set-window-option -g window-active-style fg=white,bg=colour235

        # Command / Message line
        set-window-option -g message-style fg=black,bold,bg=colour11

        # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
        set -g default-terminal "screen-256color"
        set-option -sa terminal-overrides ",xterm*:Tc"
        # Mouse works as expected
        set-option -g mouse on
        # easy-to-remember split pane commands
        bind | split-window -h -c "#{pane_current_path}"
        bind - split-window -v -c "#{pane_current_path}"
        bind c new-window -c "#{pane_current_path}"

      '';
    };
  };
}
