{ config, pkgs, lib, home-manager, ... }:

{
  programs = {    # home-manager programs, for nixpkgs use default.nix

  };
  home.packages = with pkgs; [
    blender google-chrome krita lutris wineWowPackages.staging winetricks
  ];
}
