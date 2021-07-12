{ config, lib, pkgs, ... }: {
  imports = [ ./common.nix ];

  networking.hostName = "Thinkpad";

  # Needed for wifi drivers
  hardware.enableRedistributableFirmware = true;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [];

  # File systems
  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
  };
  swapDevices = [ { device = "/swapfile"; } ];

  # CPU
  powerManagement.cpuFreqGovernor = "performance";

  # GPU
  services.xserver.videoDrivers = [ "intel" ];
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
}
