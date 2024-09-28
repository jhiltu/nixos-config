{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
{
  # Options that a module CAN SET
  options.mystuff.gaming = {
    steam = mkEnableOption "Steam";
    lutris = mkEnableOption "Lutris";
  };

  # Define what other settings, services and resources should be active
  config = mkMerge [
    {
      # Unconditional stuff.
    }
    # Conditional stuff.
    (mkIf config.mystuff.gaming.steam {
      hardware.graphics.enable32Bit = true;
      programs.steam.enable = true;
    })
    (mkIf config.mystuff.gaming.lutris {
      environment.systemPackages = with pkgs; [
        lutris
        wine
        winetricks
        dxvk_2
        vkd3d
        vkd3d-proton
      ];
    })
  ];
}
