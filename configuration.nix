{ pkgs, ... }: 

{
  # --- 1. BOOT & SYSTEM BASE ---
  imports = [ ./hardware-configuration.nix ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  time.timeZone = "Asia/Tashkent";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";

  # --- 2. GRAPHICS & HARDWARE ---
  hardware = {
    graphics.enable = true;
    bluetooth.enable = true;
    
    nvidia = {
      open = false; # Set to true if using a Turing+ GPU (16xx/20xx or newer)
      modesetting.enable = true;
      powerManagement.enable = true;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true; 
        };
        intelBusId = "PCI:0@0:2:0";
        nvidiaBusId = "PCI:2@0:0:0";
      };
    };
  };

  # --- 3. SERVICES (AUDIO, DBUS, POWER) ---
  services = {
    # Pipewire Audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    # Xserver & Display (Nvidia drivers live here)
    xserver = {
      enable = true;
      videoDrivers = [ "modesetting" "nvidia" ];
    };

    # System Utilities
    dbus.enable = true;
    upower.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    power-profiles-daemon.enable = true;

    # Login & Autologin
    getty.autologinUser = "user";
    
    logind.settings.Login = {
      HandleSuspendKey = "ignore";
      HandleSuspendKeyLongPress = "ignore";
    };
  };

  # --- 4. USER CONFIGURATION ---
  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" ];
    shell = pkgs.fish; # Correct way to set default shell
    packages = with pkgs; [ tree ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG8WDMwSqIpZRgL18utzyZmH5c4yXQ8x7WC0nQz41MmV"
    ];
  };

  # --- 5. PROGRAMS & PORTALS ---
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

  # --- 6. SECURITY ---
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  # --- 7. SYSTEM-WIDE PACKAGES ---
  environment.systemPackages = with pkgs; [
    # Essentials
    vim wget curl git home-manager
    # Terminal UI
    starship zoxide
    # Wayland / UI Tools
    waybar swaybg fuzzel mesa-demos
    # Hardware Info
    pciutils
  ];

  # --- 8. FONTS ---
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
}
