{ config, pkgs, ... }:

{

  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    QT_QPA_PLATFORMTHEME = "gtk3";
    GTK_THEME = "adw-gtk3-dark";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };

  programs.dconf.enable = true;
  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          gtk-theme = "adw-gtk3-dark";
          icon-theme = "Papirus-Dark";
          cursor-theme = "Bibata-Modern-Ice";
          cursor-size = 24;
          font-name = "JetBrains Mono 11";
        };
      };
    }
  ];
}