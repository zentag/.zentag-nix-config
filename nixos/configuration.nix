{
  pkgs,
  self,
  frc,
  ...
}: let
  frcpkgs = frc.packages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [
    ../hosts/hp-laptop.nix
  ];
  # fix 90s hang on shutdown
  virtualisation.docker.liveRestore = false;
  # nix search to find packaages
  environment.systemPackages = with pkgs; [
    android-tools
    bat
    bluetui
    btop
    delta
    dust
    eza
    fastfetch
    fd
    frcpkgs.advantagescope
    frcpkgs.choreo
    frcpkgs.elastic-dashboard
    frcpkgs.sysid
    frcpkgs.wpical
    fzf
    gh
    ghostty
    git
    glab
    gnome-network-displays
    gnome-remote-desktop
    hyprlauncher
    impala
    jre25_minimal
    nim
    nodejs
    pciutils
    pnpm
    quickemu
    ripgrep
    self.packages.${pkgs.stdenv.hostPlatform.system}.zvim
    tlrc
    usbutils
    w3m
    wl-clipboard
    yarn
    yazi
    zig
    zoxide
  ];

  fonts.packages = with pkgs; [
    fira-code
    noto-fonts
  ];
  services = {
    # simple tui login
    displayManager.ly = {
      enable = true;
      settings = {
        bigclock = "en";
        background = "0x222436";
      };
    };
    #TODO: readd remote desktop now that I'm off of gnome
    # Enable CUPS to print documents.
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
    };
    # easy vpn service
    tailscale = {
      enable = true;
    };
    # open my computer to get ssh'd into
    openssh = {
      enable = true;
      ports = [22];
      settings = {
        PasswordAuthentication = true;
        AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
        UseDns = true;
        PermitRootLogin = "prohibit-password";
      };
    };
    # enable sound with pipewire.
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

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # I like zsh :-)
  users.defaultUserShell = pkgs.zsh;

  # listen to this stuff that the nixos people worked very hard on
  # it's important!
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
