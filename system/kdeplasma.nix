{ pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Mail, organizer, etc
  /*programs.kde-pim = {
    enable = true;
    kmail = true;
    kontact = true;
  };*/

  environment.systemPackages = with pkgs; [
    kate

    # Kontact suite addon
    #korganizer
  ];
}
