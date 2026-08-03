{pkgs, ...}: {
  time.timeZone = "Asia/Tashkent";

  users.users."user" = {
    isNormalUser = true;
    description = "user";
    extraGroups = ["networkmanager" "wheel" "input" "video"];
    packages = with pkgs; [
      tree
    ];
  };
}
