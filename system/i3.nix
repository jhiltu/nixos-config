{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.xserver = {
    enable = true;

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
      ];
    };
  };
  environment.systemPackages = with pkgs; [
    kitty
  ];
}
