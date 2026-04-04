{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
    };

    gtk4.theme = config.gtk.theme;

    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    font = {
      name = "JetBrainsMono Nerd Font Propo";
      size = 11.0;
    };
  };

  qt = {
    enable = true;

    platformTheme = {
      name = "gtk3";
    };

    style = {
      name = "gtk2";
    };
  };

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk3";
  };
}
