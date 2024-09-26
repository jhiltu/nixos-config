{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kate
    neovim
    emacs

    nil # language server for nix
    nixfmt-rfc-style # format nix files
  ];
}
