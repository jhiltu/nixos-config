{ pkgs, config, ... }:
{
  imports = [
    ./home-common.nix
  ];

  home.file = {
    ".config/doom".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/dotfiles/.config/doom";
  };

  home.stateVersion = "24.05"; # Don't touch!
}
