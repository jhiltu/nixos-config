# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/basics.nix
    ../../system/audio.nix
    ../../system/nvidia.nix
    ../../system/kdeplasma.nix
    ../../system/browsers.nix
    ../../system/gaming.nix
    ../../system/virtualization.nix
    ../../system/screenrecording.nix

    # dev
    ../../system/dev/clojure.nix
    ../../system/dev/lisp.nix
  ];

  networking.hostName = "enne";
  zramSwap.enable = true;

  # zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # gaming!
  mystuff.gaming.steam = true;
  mystuff.gaming.lutris = true;
  environment.systemPackages = with pkgs; [
    bottles
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
