{ config, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 1;
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

  fonts.fonts = with pkgs; [
    carlito
    vegur
    source-code-pro
    jetbrains-mono
    font-awesome
    corefonts
    (nerdfonts.override {
      fonts = [
        "FiraCode"
      ];
    })
  ];

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
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "22.11";
}
