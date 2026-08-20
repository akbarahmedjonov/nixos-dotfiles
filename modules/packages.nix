{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    neovim
    git
    xwayland-satellite
    libva-utils
    obs-studio
    libnotify
    ghostty
    brave
    fuzzel
    wl-clipboard
    quickshell
    nil
    alejandra
    pcmanfm
    vscode
    tmux
    eza
    bat
    yazi
    zip
    unzip
    zoxide
    opencode
    adw-gtk3
    papirus-icon-theme
    bibata-cursors
    telegram-desktop
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
