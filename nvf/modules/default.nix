{
  # enable NVF itself
  programs.nvf.enable = true;

  # Example plugin (from nixpkgs)
  programs.nvf.extraPlugins = with pkgs.vimPlugins; [
    nvim-autopairs
  ];

  # Optional: plugin config
  programs.nvf.extraConfigLua = ''
    require("nvim-autopairs").setup {}
  '';
}
