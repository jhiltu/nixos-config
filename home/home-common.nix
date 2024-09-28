{ pkgs, ... }:
{
  home.username = "sose";
  home.homeDirectory = "/home/sose";

  home.packages = with pkgs; [
    starship
  ];

  home.file = {
    ".zshrc".source = ../dotfiles/.zshrc;
    ".config/nvim".source = ../dotfiles/.config/nvim;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
