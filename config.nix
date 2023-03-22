{ config, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # Localisation Settings  
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  # Default Console Settings
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # User account I use on all hosts
  users.users.shaun= {
    home = "/home/shaun";
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" "lp" "scanner" ];
    initialPassword = "password";
  };

  environment.systemPackages = with pkgs; [
    git gptfdisk inxi nano pciutils usbutils wget
  ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "22.11";
}
