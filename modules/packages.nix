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
    nil
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

    # Nvim lsp and formatters

    # LSP servers
    basedpyright
    lua-language-server
    clang-tools          # clangd + clang-format
    rust-analyzer
    typescript-language-server
    typescript
    vscode-langservers-extracted  # html, cssls
    nil                  # nil_ls

    # Formatters (conform.nvim)
    ruff                 # ruff_format
    rustfmt
    stylua
    prettier
    alejandra

    # Runtime deps for telescope.nvim / oil.nvim / vim.pack.add
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
