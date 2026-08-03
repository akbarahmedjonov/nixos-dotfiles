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
    home-manager
    tmux
    eza
    bat
    yazi
    zip
    unzip
    zoxide
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
  ];
}
