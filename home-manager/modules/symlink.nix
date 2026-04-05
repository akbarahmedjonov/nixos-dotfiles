{ config, ... }:
let
  dotfilesPath = "${config.home.homeDirectory}/n/home-manager/configs";
  mkSymlink = path: config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/${path}";
  
  apps = [
    "fish"
    "kitty"
    "niri"
    "noctalia"
    "tmux"
    "starship.toml" 
  ];
in
{
  xdg.configFile = builtins.listToAttrs (map (name: {
    inherit name;
    value = {
      source = mkSymlink name;
      recursive = true; 
    };
  }) apps);
}
