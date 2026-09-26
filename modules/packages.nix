{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    neovim
    xwayland-satellite
    libva-utils
    obs-studio
    libnotify
    ghostty
    brave-origin
    noctalia
    wl-clipboard
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
    zed-editor
    cliamp
    kew
    mpv
    swayimg
    yt-dlp
    htop
    btop
    pavucontrol
    nnn
    amberol
    wiremix
    evince
    onlyoffice-desktopeditors
    localsend
    starship

    # Nvim lsp and formatters
    basedpyright
    lua-language-server
    clang-tools          
    nil                  
    ruff                 
    stylua
    alejandra
    git
    ripgrep
    fd
    fzf
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
