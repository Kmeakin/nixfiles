{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.consoleMode = "max";
  boot.loader.systemd-boot.editor = false;
  boot.loader.systemd-boot.memtest86.enable = true;

  # enable REISUB
  boot.kernel.sysctl = { "kernel.sysrq" = 1; };
  boot.kernelParams = [ "sysrq_always_enabled=1" ];

  # locale/timezone
  i18n.defaultLocale = "en_GB.UTF-8";
  time.timeZone = "Europe/London";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # Networking
  services.resolved.enable = true;
  networking = {
    resolvconf.dnsExtensionMechanism = false;
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
  };

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;

  # X11
  services.xserver.enable = true;
  services.xserver.layout = "gb";
  services.xserver.xkbOptions = "terminate:ctrl_alt_bksp, ctrl:ralt_rctrl";

  # KDE
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "qt";
  };

  # Users
  users.users.karl = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  environment.extraInit = ''
    if test -f  "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"; then
       . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    fi
  '';
  environment.pathsToLink = [ "/share/zsh" ]; # enable zsh completions

  # TODO: can this be moved to home-manager somehow?
  fonts.fonts = with pkgs; [
    fira-code
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];

  # TODO: workaround for https://github.com/NixOS/nixpkgs/issues/124215
  documentation.info.enable = false;

  system.stateVersion = "20.09";
}
