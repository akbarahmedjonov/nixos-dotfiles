{ pkgs,inputs, ... }:

{

  home.packages = with pkgs; [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    alejandra
    kitty
    yazi
    neovim
    telegram-desktop
    eza
    trash-cli
    opencode
    fzf
    fd
    ripgrep
    btop
    htop
    fastfetch
    nitch
    vscode
    lazygit
    tmux
    noctalia-shell
    noctalia-qs
    nautilus
    bat
    cliphist
    xwayland-satellite
    obs-studio
    imv 
    mpv
    pyright
    python3
    nixd
    lynx
    asciiquarium-transparent
    cmatrix
    cava
    lavat
    pokemon-colorscripts
    pipes
    fortune
    cowsay
    stow
    lua-language-server
    stylua
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  nixpkgs.config.allowUnfree=true;

}
