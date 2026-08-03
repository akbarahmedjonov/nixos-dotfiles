{...}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/bundle.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "26.05";
}
