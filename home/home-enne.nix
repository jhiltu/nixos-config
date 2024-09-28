{ pkgs, ... }:
{
  imports = [
    ./home-common.nix
  ];
  home.stateVersion = "24.05"; # Don't touch!
}
