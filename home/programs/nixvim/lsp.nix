{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      # Average webdev LSPs
      astro.enable = true;
      ts_ls.enable = true; # TS/JS
      cssls.enable = true; # CSS
      tailwindcss.enable = true; # TailwindCSS
      html.enable = true; # HTML
      svelte.enable = true; # Svelte
      pyright.enable = true; # Python
      marksman.enable = true; # Markdown
      nil_ls.enable = true; # Nix
      dockerls.enable = true; # Docker
      bashls.enable = true; # Bash
      clangd.enable = true; # C/C++
      yamlls.enable = true; # YAML
      jdtls.enable = true; # Java
      gopls.enable = true;
      lua_ls = {
        # Lua
        enable = true;
        settings.telemetry.enable = false;
      };

      # Rust
      rust_analyzer = {
        enable = true;
        installRustc = true;
        installCargo = true;
      };
    };
  };
}
