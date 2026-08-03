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
    foot
    librewolf
    noctalia
    nil
    alejandra
    pcmanfm
    zed-editor
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
  ];

  programs = {
    niri.enable = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    jetbrains-mono
  ];
}
