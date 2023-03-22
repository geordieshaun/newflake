{ config, pkgs, lib, home-manager, ... }:

{
  programs = {

  };

  home.packages = with pkgs; [
    blender google-chrome lutris wineWowPackages.staging winetricks
  ];
}
