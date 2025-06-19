{ pkgs, ... }:
{
  # nix search wget
  environment.systemPackages = with pkgs; [
    bat
    btop
    deja-dup
    delta
    du-dust
    eza
    fastfetch
    fd
    fzf
    gh
    git
    gnome-remote-desktop
    nodejs
    pciutils
    python312Packages.pynvim
    python312Packages.pynvim-pp
    python312Packages.python-lsp-server
    ripgrep
    silver-searcher
    tlrc
    usbutils
    vim-language-server
    vimPlugins.coq_nvim
    w3m
    wl-clipboard
    yarn
    zoxide
  ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  musnix = {
    enable = true;
    kernel.realtime = true;
    kernel.packages = pkgs.linuxPackages-rt_latest;
    rtirq.enable = true;
  };
  nix = {
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 30d";
    };
  };
  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  hardware = {
    enableAllFirmware = true;

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
  networking = {
    hostName = "zens-good-laptop"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # Enable networking
    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd";

    firewall.enable = false;
  };
  # Set your time zone.
  time.timeZone = "America/Indiana/Indianapolis";

  # Select internationalisation properties.
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
    flatpak.enable = true;
    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xrdp = {
      enable = true;
      openFirewall = true;
      defaultWindowManager = "gnome-remote-desktop";
    };

    # Enable CUPS to print documents.
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    tailscale = {
      enable = true;
    };

    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = true;
        AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "prohibit-password";
      };
    };
    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = false;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };
  security.rtkit.enable = true;
  virtualisation.docker.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).
  # xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    zen = {
      isNormalUser = true;
      description = "Zen Gunawardhana";
      extraGroups = [
        "networkmanager"
        "wheel"
        "audio"
        "dialout"
      ];
      packages = with pkgs; [
        firefox
        #  thunderbird
      ];
    };

  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];

  users.defaultUserShell = pkgs.zsh;
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
