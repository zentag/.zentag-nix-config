{
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      # support apps that use pulse and jack audio
      pulse.enable = true;
      jack.enable = true;
    };
  };
  # recommended because of pipewire, grants better performance/lower latency
  security.rtkit.enable = true;
}
