{ config, pkgs, lib, home-manager, ... }:

{
  programs = {

  };

  home.packages = with pkgs; [
    google-chrome
  ];
}
