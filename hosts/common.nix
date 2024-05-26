{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable REISUB
  boot.kernel.sysctl = { "kernel.sysrq" = 1; };
  boot.kernelParams = [ "sysrq_always_enabled=1" ];

  # Locale / Timezone
  i18n.defaultLocale = "en_GB.UTF-8";
  time.timeZone = "Europe/London";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  programs.gnupg.agent = {
    enable = true;
  };
}
