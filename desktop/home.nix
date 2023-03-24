{ config, pkgs, lib, home-manager, ... }:

{
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  home.packages = with pkgs; [
    blender google-chrome lutris wineWowPackages.staging winetricks
  ];
}
