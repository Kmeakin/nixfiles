{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

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
  networking = { networkmanager.enable = true; };
  networking.resolvconf.dnsExtensionMechanism = false;

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.package = pkgs.pulseaudio.overrideAttrs (
    attrs: {
      patches = [ ./disable-esound.patch ];
    }
  );

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

  # for live share
  # TODO: delete when no longer needed
  services.gnome3.gnome-keyring.enable = true;

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

  system.stateVersion = "20.09";
}
