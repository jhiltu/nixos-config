{ pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    kate
    kdenlive
  ];
}
