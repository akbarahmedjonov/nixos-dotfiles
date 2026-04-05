{
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Tashkent";
  programs = {
    niri.enable = true;
    xwayland.enable = true;
    fish.enable = true;
    ssh.startAgent = true;
  };
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  ## Security

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  services = {
    ## Audio

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    ## Intel and nvidia graphics drivers

    xserver = {
      enable = true;
      videoDrivers = [
        "modesetting"
        "nvidia"
      ];
    };

    ## Other services

    gnome.gcr-ssh-agent.enable = false;
    dbus.enable = true;
#    displayManager= {
#      sddm = {
#        enable=true;
#	settings = {
#          Autologin = {
#            Session = "niri.desktop";
#	    User = "user";
#	  };
#	};
#      };
#    };
    getty.autologinUser = "user";
    upower.enable = true;
    gvfs.enable = true;
    power-profiles-daemon.enable = true;
    tumbler.enable = true;
    logind.settings.Login = {
      enable = true;
      HandleSuspendKey = "ignore";
      HandleSuspendKeyLongPress = "ignore";
    };
  };
  users.users.user = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "audio" "video" "input"];
    shell = pkgs.fish;
    packages = with pkgs; [
      tree
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG8WDMwSqIpZRgL18utzyZmH5c4yXQ8x7WC0nQz41MmV"
    ];
  };
  hardware.bluetooth.enable = true;
  networking.firewall.enable = false;
  environment.systemPackages = with pkgs; [
    starship
    zoxide
    vim
    wget
    curl
    waybar
    git
    swaybg
    home-manager
    fuzzel
    pciutils
    mesa-demos
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
  hardware = {
    graphics.enable = true;
    nvidia = {
      open = false;
      modesetting.enable = true;
      powerManagement.enable = true;
    };
    nvidia.prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true; # gives you `nvidia-offload`
      };
      intelBusId = "PCI:0@0:2:0";
      nvidiaBusId = "PCI:2@0:0:0";
    };
  };
}
