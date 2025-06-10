{
  programs.nixvim = {
    plugins = {
      mini = {
        enable = true;
        modules = {
          files = {
            enable = true;
          };
          ai = {
            enable = true;
          };
          comment.enable = true;
          snippets.enable = true;
          icons.enable = true;
          completion = {
            enable = true;
          };
	  operators.enable = true;
	  pairs.enable = true;
	  surround.enable = true;
	  bracketed.enable = true;
	  diff.enable = true;
	  extra.enable = true;
	  pick.enable = true;
	  git.enable = true;
	  jump.enable = true;
	  notify.enable = true;
        };
      };
      alpha = {
        enable = true;
        theme = "dashboard";
      };
      vim-be-good = {
        enable = true;
      };
      gitsigns = {
        enable = true;
        settings.current_line_blame = true;
      };
      mkdnflow = {
        enable = true;
        tables = {
          autoExtendCols = true;
          autoExtendRows = true;
          formatOnMove = true;
        };
      };
      telescope = {
        enable = true;
        keymaps = {
          "<leader>g" = "live_grep";
          "<leader>f" = "find_files";
          "<leader>m" = "media_files";
        };
        extensions.media-files.enable = true;
      };
      web-devicons.enable = true;
      todo-comments.enable = true;
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
        };
      };
      markdown-preview = {
        enable = true;
      };
      trouble = {
        enable = true;
      };
    };
  };
}
