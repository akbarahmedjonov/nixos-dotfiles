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
