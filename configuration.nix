# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # weird fix
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;
  # nix search wget
  environment.systemPackages = with pkgs; [
    (python3.withPackages (python-pkgs: [
      # select Python packages here
      python-pkgs.pynvim
    ]))
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
    neovim
    ventoy
    nodejs
    pciutils
    python311Packages.pynvim
    python311Packages.pynvim-pp
    python311Packages.python-lsp-server
    qemu
    quickemu
    ripgrep
    silver-searcher
    thefuck
    tlrc
    usbutils
    vim-language-server
    vimPlugins.coq_nvim
    w3m
    wl-clipboard
    yarn
    zoxide
  ];
  
  nix.settings.experimental-features = ["nix-command" "flakes"];

  musnix = {
    enable = true;
    kernel.realtime = true;
    kernel.packages = pkgs.linuxPackages-rt_latest;
    rtirq.enable = true;
  };
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.enableAllFirmware = true; 
 
  hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
   };

  networking.hostName = "zens-good-laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.iwd.enable = true;
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  networking.firewall.allowedTCPPorts = [443 8080 8088 1716 1717 1718 1719 1720 1721 1722 1723 1724 1725 1726 1727 1728 1729 1730 1731 1732 1733 1734 1735 1736 1737 1738 1739 1740 1741 1742 1743 1744 1745 1746 1747 1748 1749 1750 1751 1752 1753 1754 1755 1756 1757 1758 1759 1760 1761 1762 1763 1764 ];
  networking.firewall.allowedUDPPorts = [443 8080 8088 1716 1717 1718 1719 1720 1721 1722 1723 1724 1725 1726 1727 1728 1729 1730 1731 1732 1733 1734 1735 1736 1737 1738 1739 1740 1741 1742 1743 1744 1745 1746 1747 1748 1749 1750 1751 1752 1753 1754 1755 1756 1757 1758 1759 1760 1761 1762 1763 1764 ];


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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb = {layout = "us";
    variant = "dvorak";};
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.tailscale = {
    enable = true;
  };

  services.openssh = {
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
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zen = {
    isNormalUser = true;
    description = "Zen Gunawardhana";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };

  users.users.noah = {
    isNormalUser  = true;
    home  = "/home/noah";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true; 
  environment.pathsToLink = [ "/share/zsh" ];

  users.defaultUserShell = pkgs.zsh;

  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    baseIndex = 1;
    newSession = true;
    # Stop tmux+escape craziness.
    escapeTime = 0;
    # Force tmux to use /tmp for sockets (WSL2 compat)
    secureSocket = false;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
    ];

    extraConfig = ''
      # Set shell to zsh
      set -g default-shell /run/current-system/sw/bin/zsh

      # Set Prefix
      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix

      # Cool trick: Let's dim out any pane that's not active.
      set-window-option -g window-style fg=white,bg=colour234
      set-window-option -g window-active-style fg=white,bg=colour235
      
      # Command / Message line
      set-window-option -g message-style fg=black,bold,bg=colour11

      # Status Bar
      set-option -g status-style fg=white,bg=colour04
      set-window-option -g window-status-style fg=colour118,bg=colour238
      set-window-option -g window-status-current-style fg=black,bold,bg=colour011
      set-window-option -g window-status-last-style fg=black,bold,bg=colour011
      set-window-option -g window-status-separator ' | '

      # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
      # set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"

      # Mouse works as expected
      set-option -g mouse on
      # easy-to-remember split pane commands
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      # vim arrow commands
      bind -r h select-pane -L
      bind -r j select-pane -D 
      bind -r k select-pane -U
      bind -r l select-pane -R

      bind -r C-h resize-pane -L
      bind -r C-j resize-pane -D
      bind -r C-k resize-pane -U
      bind -r C-l resize-pane -R

      # unbind arrows
      unbind Up
      unbind Down
      unbind Left
      unbind Right
      unbind C-Up
      unbind C-Down
      unbind C-Right
      unbind C-Left
    '';
  };
  
  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
