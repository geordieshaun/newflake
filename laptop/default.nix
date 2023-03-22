{ config, pkgs, ... }:

{
  # Import hardware config
  imports = [ ./hardware.nix ];

  # Network config
  networking.hostName = "laptop";
  networking.networkmanager.enable = true;

  # Desktop environment config
  services.xserver = {
    enable = true;
    libinput.enable = true;
    videoDrivers = [ ];
    layout = "gb";
    displayManager.gdm.enable = true;
    desktopManager = {
      gnome = {
        enable = true;
      };
    };
  };

  # Graphics card settings
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # Sound settings
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;

    config.pipewire = {
      "context.properties" = {
        "default.clock.allowed-rates" = [ 48000 44100 ];
      };
    };
  };

  # Enable bluetooth
  hardware.bluetooth.enable = true;
}
