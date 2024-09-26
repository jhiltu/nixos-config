{ pkgs, ... }:
{
  # Nvidia
  services.xserver.videoDrivers = ["nvidia"];

  hardware.opengl.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = true;
    nvidiaSettings = true;
  };
}

