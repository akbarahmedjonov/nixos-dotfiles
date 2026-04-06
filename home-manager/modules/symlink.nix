{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/n/home-manager/configs";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    "kitty"    = "kitty";
    "niri"     = "niri";
    "noctalia" = "noctalia";
    "tmux"     = "tmux";
    "nvim"     = "nvim";
    "starship.toml" = "starship.toml";
  };
in
{
  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;
}
