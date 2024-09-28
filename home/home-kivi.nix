{ pkgs, ... }:
{
  imports = [
  ];

  home.stateVersion = "24.05"; # Don't touch!

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sose";
  home.homeDirectory = "/home/sose";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  #home.packages = with pkgs; [  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".zshrc".source = ../dotfiles/.zshrc;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
