{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules/hm/bundle.nix
  ];

  home.username = "akbar";
  home.homeDirectory = "/home/akbar";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    fzf
    fd
    zoxide
    starship
    ruff
    pyright
    typescript-language-server
    lua-language-server
    clang-tools
    rust-analyzer
    vscode-langservers-extracted
    vue-language-server
    ruff
    taplo
    prettier
    stylua
    tmux
    alejandra
    foot
    mako
    vscodium
    swaybg
    hyprpicker
    hypridle
    hyprlock
    bibata-cursors
    nautilus
    waybar
    eza
    fastfetch
    trash-cli
    opencode
    yazi
    yaziPlugins.full-border
    typescript
    pavucontrol
    baobab
    python3
    waypaper
    btop
    htop
    mpv
    yt-dlp
    imv
    nwg-look
    bat
  ];

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata Modern Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    font = {
      name = "JetBrainsMono Nerd Font Propo Regular";
    };
  };
}
