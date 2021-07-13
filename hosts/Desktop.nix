{ config, lib, pkgs, ... }: {
  imports = [ ./common.nix ];

  networking.hostName = "Desktop";

  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.availableKernelModules =
    [ "xhci_pci" "ehci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [];

  # File systems
  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_ROOT";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-label/NIXOS_BOOT";
    fsType = "vfat";
  };
  swapDevices = [ { device = "/swapfile"; } ];

  programs.steam.enable = true;

  # CPU
  powerManagement.cpuFreqGovernor = "performance";

  # GPU
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl = {
    enable = true;
    driSupport = true;
    setLdLibraryPath = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      libglvnd
    ];
  };

  # TODO: HDMI audio just stopped working one day, now this is required.
  hardware.pulseaudio.extraConfig = ''
    load-module module-alsa-sink device=hw:2,3
  '';

}
