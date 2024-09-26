{ pkgs, ... }:
{
  imports = [
    ./sh.nix
    ./editors.nix
  ];

  home.stateVersion = "24.05"; # Don't touch!

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sose";
  home.homeDirectory = "/home/sose";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    wget
    curl
    neovim
    firefox
    discord
    spotify
    # git and github cli
    git
    gh

    (nerdfonts.override {
      fonts = [
        "Noto"
        "JetBrainsMono"
      ];
    })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
