{ config, pkgs, lib, home-manager, ... }:

{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      luafile ${./init.lua}
    '';
    plugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      nvim-tree-lua
      indentLine

      vim-nix

      # LSP Stuff
      nvim-lspconfig
      nvim-compe

      # Eye Candy
      nvim-treesitter
    ];
  };
}
