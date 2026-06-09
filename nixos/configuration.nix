{
  pkgs,
  self,
  frc,
  ...
}: let
  frcpkgs = frc.packages.${pkgs.stdenv.hostPlatform.system};
in {
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

  programs = {
    # better than bash ;)
    zsh.enable = true;
    hyprland = {
      enable = true;
      # necessary for compatibility with apps that don't support the newer wayland protocol
      xwayland.enable = true;
    };
  };
  fonts.packages = with pkgs; [
    fira-code
    noto-fonts
  ];
  nix = {
    optimise.automatic = true;
    # removes no longer required derivations from nix store (garbage collection)
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 30d";
    };
    settings = {
      # adds community cache so things like frc-nix packages are downloaded binaries rather than built on my machine
      substituters = ["https://nix-community.cachix.org"];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      # everyone uses flakes nowadays :)
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
  # bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  hardware = {
    enableAllFirmware = true;
    # isn't on by default for some reason...
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
  #TODO: figure out if something like this is necessary now that I've switched to iwd only
  powerManagement.resumeCommands = ''
    nmcli r wifi on
  '';
  networking = {
    hostName = "zens-good-laptop";
    # use iwd for wifi (NOT wpa_supplicant or network manager)
    wireless.iwd.enable = true;
    # turn off firewall cause it gets in the way occasionally
    firewall.enable = false;
  };

  time.timeZone = "America/Indiana/Indianapolis";

  # select internationalisation properties.
  # tbh this was done by the installer and I don't feel like messing with it
  # no idea if it's really necessary
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

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
