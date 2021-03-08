# Settings common to every machine

{ config, pkgs, ... }: {
  imports = [ ./desktop.nix ];

  nixpkgs.config.allowUnfree = true;

nix = {
package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
};

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

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

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
  };

  environment.extraInit = ''
    if test -f  "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"; then
       . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    fi
  '';
  environment.pathsToLink = [ "/share/zsh" ]; # enable zsh completions

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}
