{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "akbarahmedjonov";
        email = "teamender1991@gmail.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      signing = {
        signByDefault = true;
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN/JHC3ZeygZOSjCsbDT5PB9djdD1w5owfGksgBWJnBI akbar@nixos-btw";
      };
    };
  };
}
