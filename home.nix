{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "zen";
  home.homeDirectory = "/home/zen";
  programs = {  
    zsh = {
      enable = true;
      shellAliases = {
        ls="eza --width=75 --hyperlink --color=always --git --icons=always";
        cd="z";
        kali="quickemu --vm kali-kali-weekly.conf --display spice";
        update-sys="sudo nixos-rebuild switch --upgrade --flake ~/.zentag-nix-config/";
        update-user="home-manager switch --flake ~/.zentag-nix-config/";
        update-lock="cd ~/.zentag-nix-config/ && nix flake update";
        update="olddir=$(pwd) && update-lock && update-sys && update-user && cd ~/.zentag-nix-config && git add . && git commit -m 'autoupdate' && git push origin & cd $olddir";
        home-config="nvim ~/.zentag-nix-config/home.nix && update-user && source ~/.zshrc && tput setaf 1; echo 'You should git commit now!!!' && cd ~/.zentag-nix-config";
        nix-config="nvim ~/.zentag-nix-config/configuration.nix && sudo nixos-rebuild switch --flake ~/.zentag-nix-config/ && tput setaf 1; echo 'You should git commit now!!!' && cd ~/.zentag-nix-config/";
        ga="git add";
        gp="git push origin";
        gf="git pull";
        gb="git branch";
        gc="git commit";
        gch="git checkout";
        gd="git diff";
        galias="alias | grep -oE 'g[a-z]=.?*'";
        ff="fastfetch";
        fk="fuck";
      };
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      plugins = [
        {
          name = "powerlevel10k-config";
          src = ./p10k;
          file = "p10k.zsh";
        }
        {
          name = "zsh-powerlevel10k";
          src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
          file = "powerlevel10k.zsh-theme";
        }
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
        {
          name = "fzf-git-sh";
          file = "fzf-git.sh";
          src = pkgs.fetchFromGitHub {
            owner = "junegunn";
            rev = "bd8ac4ba4c9d7d12b34f7fa2b0d334f50cdb5254";
            repo = "fzf-git.sh";
            sha256 = "sha256-ZYgov/P7fcB1Zjj5UMVbr7+bjRKLwzpqddHBOCNd+RQ=";
          };
        }
      ];
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    thefuck = {
      enable = true;
      enableZshIntegration = true;
    };
  };

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
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    gnome.tali
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
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
