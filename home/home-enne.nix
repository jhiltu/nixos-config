{ pkgs, ... }:
{
  imports = [
  ];
  home.stateVersion = "24.05"; # Don't touch!

  home.username = "sose";
  home.homeDirectory = "/home/sose";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    starship
  ];

  home.file = {
    ".zshrc".source = ../dotfiles/.zshrc;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
