{
  config,
  pkgs,
  lib,
  ...
}:
let
  pkgGrps = config.customOpts.pkgGroups;
in
{
  imports = [
    ./programs
    ./dconf.nix
  ];
  options.customOpts = {
    pkgGroups = {
      programming = lib.mkEnableOption "Add tools to enable programming";
      design = lib.mkEnableOption "Add tools for 3d and PCD design";
      office = lib.mkEnableOption "Add office software: writing, text processing, etc.";
      fun = lib.mkEnableOption "Fun stuff";
      music = lib.mkEnableOption "Music programs";
      video = lib.mkEnableOption "Video programs";
    };
  };
  config = {
    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "24.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages =
      with pkgs;
      if pkgGrps.fun then
        [
          cmatrix
          toipe
          prismlauncher
          asciiquarium
        ]
      else
        [ ]
        ++ (
          if pkgGrps.programming then
            [
              cargo
              nodePackages.neovim
              arduino-ide
              sqlite
              go
              supabase-cli
              gcc_multi
              pnpm
              prettierd
              rustc
              python314
              turso-cli
            ]
          else
            [ ]
        )
        ++ (
          if pkgGrps.design then
            [
              cura-appimage
              freecad
              kicad
              prusa-slicer
            ]
          else
            [ ]
        )
        ++ (
          if true then
            [
              zoom-us
              libreoffice
              ungoogled-chromium
              slack
            ]
          else
            [ ]
        )
        ++ (
          if pkgGrps.video then
            [
              obs-studio
            ]
          else
            [ ]
        )
        ++ (
          if pkgGrps.music then
            [
              musescore
              reaper
            ]
          else
            [ ]
        )
        ++ [
          bottom
          obsidian
          # # It is sometimes useful to fine-tune packages, for example, by applying
          # # overrides. You can do that directly here, just don't forget the
          # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
          # # fonts?
          # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

          # # You can also create simple shell scripts directly inside your
          # # configuration. For example, this adds a command 'my-hello' to your
          # # environment:
          # (pkgs.writeShellScriptBin "my-hello" ''
          #   echo "Hello, ${config.home.username}!"
          # '')
        ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. These will be explicitly sourced when using a
    # shell provided by Home Manager. If you don't want to manage your shell
    # through Home Manager then you have to manually source 'hm-session-vars.sh'
    # located at either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/zen/etc/profile.d/hm-session-vars.sh
    #
    home.sessionVariables = {
      EDITOR = "nvim";
    };

    nixpkgs.config.allowUnfree = true;

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };
}
