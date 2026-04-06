{...}: {
  imports = [
    ./modules/theme.nix
    ./modules/packages.nix
    ./modules/git.nix
  ];
  home.username = "user";
  home.homeDirectory = "/home/user";

  home.stateVersion = "25.05";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = 24;
  };

  programs.home-manager.enable = true;
}
