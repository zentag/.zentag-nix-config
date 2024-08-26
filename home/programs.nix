{ pkgs, ... }:
{
  programs = {  
    zsh = {
      enable = true;
      shellAliases = {
        cd="z";
        ff="fastfetch";
        fk="fuck";
        ga="git add";
        galias="alias | grep -oE 'g[a-z][a-z]?=.?*'";
        gb="git branch";
        gc="git commit";
        gch="git checkout";
        gd="git diff";
        gf="git pull";
        gp="git push origin";
        gs="git status";
        gr="git restore";
        home-config="nvim ~/.zentag-nix-config/home.nix && update-user && source ~/.zshrc && tput setaf 1; echo 'You should git commit now!!!' && cd ~/.zentag-nix-config";
        kali="quickemu --vm kali-kali-weekly.conf --display spice";
        ls="eza --width=75 --hyperlink --color=always --git --icons=always";
        nix-config="nvim ~/.zentag-nix-config/configuration.nix && sudo nixos-rebuild switch --flake ~/.zentag-nix-config/ && tput setaf 1; echo 'You should git commit now!!!' && cd ~/.zentag-nix-config/";
        update-lock="cd ~/.zentag-nix-config/ && nix flake update";
        update-sys="sudo nixos-rebuild switch --upgrade --flake ~/.zentag-nix-config/";
        update-user="home-manager switch --flake ~/.zentag-nix-config/";
        update="olddir=$(pwd) && update-lock && update-sys && update-user && cd ~/.zentag-nix-config && git add . && git commit -m 'autoupdate' && git push origin & cd $olddir";
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
      
      initExtra = "export ANDROID_HOME=$HOME/Library/Android/sdk \nexport PATH=$PATH:$ANDROID_HOME/emulator \nexport PATH=$PATH:$ANDROID_HOME/platform-tools";
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
  
}
