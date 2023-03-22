{ config, pkgs, lib, home-manager, ... }:

{
  home = {
    username = "shaun";
    homeDirectory = "/home/shaun";
    stateVersion = "22.11";
  };

  imports = [ ./programs/nvim.nix ];
  home.packages = with pkgs; [
    google-chrome
  ];
}
