{
  services = {
    pulseaudio.enable = false;
    upower.enable = true;
    displayManager.ly.enable = true;
    power-profiles-daemon.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    dbus.enable = true;
    logind.settings.Login = {
      HandleSuspendKey = "ignore";
      HandleSuspendKeyLongPress = "ignore";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

hardware.graphics = {
  enable = true;
  extraPackages = with pkgs; [
    intel-media-driver    
    intel-vaapi-driver 
    vpl-gpu-rt             
    intel-compute-runtime  
  ];
};
}
