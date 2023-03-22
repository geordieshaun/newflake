{ config, pkgs, ... }:

{
  # Import hardware config
  imports = [ ./hardware.nix ];

  # Network config
  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  # Desktop environment config
  services.xserver = {
    enable = true;
    libinput.enable = true;
    videoDrivers = [ "amdgpu" ];
    layout = "gb";
    xkbVariant = "mac";
    displayManager.sddm.enable = true;
    desktopManager = {
      plasma5 = {
        enable = true;
        excludePackages = with pkgs.libsForQt5; [
          elisa gwenview okular oxygen khelpcenter
        ];
      };
    };
  };

  # Graphics card settings
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      rocm-opencl-icd
      rocm-opencl-runtime
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
