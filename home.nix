{ config, pkgs, lib, home-manager, ... }:

{
  home = {
    username = "shaun";
    homeDirectory = "/home/shaun";
    stateVersion = "22.11";
  };

  imports = [ ./programs/nvim/nvim.nix ];

  programs = {
    zsh = {
      enable = true;
      shellAliases = {
        ll = "ls -l";
      };
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
    };
  };

  home.packages = with pkgs; [
    google-chrome
  ];
}
