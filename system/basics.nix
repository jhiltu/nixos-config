{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Enable networking
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false; # slows boot by 5-10s

  time.timeZone = "Europe/Helsinki";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fi_FI.UTF-8";
    LC_IDENTIFICATION = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_NAME = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };
  # zsh
  environment.shells = with pkgs; [
    bash
    zsh
  ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fi";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "fi";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sose = {
    isNormalUser = true;
    description = "Joni Hiltunen";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    # packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);

  # Packages for all environments
  environment.systemPackages = with pkgs; [
    # editors
    vim neovim emacs
    xclip wl-clipboard lua luarocks tree-sitter nodejs # for nvim..?

    # Nix helpers
    nil # language server
    nixfmt-rfc-style # formatter

    # version control etc
    git gh lazygit wget curl

    # dev
    gnumake gcc clang
    unzip busybox

    # system utils
    pciutils inxi
    ripgrep fd tree
    fastfetch
    btop htop
    nmap

    # browsers

    # important desktop applications
    discord spotify calibre

    # graphics etc
    pinta

  ];

  # Fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts noto-fonts-emoji noto-fonts-cjk
      font-awesome
      fira fira-code
      libertine
      source-serif-pro
      liberation_ttf
      ubuntu_font_family
      hack-font
      unifont
      corefonts
      vistafonts
      roboto
      (nerdfonts.override {
        fonts = [
          "Noto"
          "JetBrainsMono"
          "FiraCode"
          "SourceCodePro"
        ];
      })
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Liberation Serif" ];
        sansSerif = [ "Ubuntu" ];
        monospace = [ "Ubuntu Mono" ];
      };
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Polkit (explicitly for i3 etc)
  security.polkit.enable = true;
}
