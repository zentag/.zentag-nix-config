{self, ...}: {
  flake.nixosModules.zsh = {pkgs, ...}: {
    home-manager.sharedModules = [self.homeModules.zsh];
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;
  };
  flake.homeModules.zsh = {pkgs, ...}: {
    programs = {
      # this runs contents of .envrc in a directory if you use direnv allow . first
      direnv = {
        enable = true;
        enableZshIntegration = true;
        # lets you have 'use flake' in .envrc to load dev shell of flake
        nix-direnv.enable = true;
      };
      zsh = {
        enable = true;
        # these are exposed as aliases (like commands) in your terminal
        shellAliases = {
          c = "~/.zentag-nix-config/helpers/config.sh";
          cd = "z";
          d = "nix develop -c $SHELL";
          ff = "fastfetch";
          fk = "fuck";
          g = "ga . && gc -m ";
          ga = "git add";
          galias = "alias | grep -oE 'g[a-z][a-z]?=.?*'";
          gb = ''func(){git checkout -b "$1" && git push -u origin "$1";}; func'';
          gc = "git commit";
          gch = "git checkout";
          gd = "git diff";
          gf = "git pull";
          gm = "git merge";
          gp = "git push";
          gpb = "git push --set-upstream origin";
          gr = "git restore";
          grs = "git restore --staged";
          gs = "git status";
          idf = "~/.zentag-nix-config/helpers/idf.sh";
          kali = "quickemu --vm kali-kali-weekly.conf --display spice";
          ls = "eza --width=75 --hyperlink --color=always --git --icons=always";
          n = "~/.zentag-nix-config/helpers/neovim.sh";
          update = "~/.zentag-nix-config/helpers/update.sh";
          update-lock = "cd ~/.zentag-nix-config/ && nix flake update";
          update-sys = "sudo nixos-rebuild switch --upgrade --flake ~/.zentag-nix-config/";
          update-user = "home-manager switch --flake ~/.zentag-nix-config/";
          v = "nvim ~/vimbegood";
        };
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        plugins = [
          # stuff for the theme I like
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
          # uses zsh when you run nix-shell
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
          # fun stuff like ctrl g h to search through git commits
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
      # fuzzy find for command history lookup using ctrl r
      fzf = {
        enable = true;
        enableZshIntegration = true;
      };
      # using z (or cd since I aliased it above) find directories fuzzily or with abbreviations, weighted by use
      zoxide = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}
