{ config, lib, pkgs, modulesPath, ... }: {
  imports = [ ./common.nix ];

  networking.hostName = "Thinkpad";

  # Needed for wifi drivers
  hardware.enableRedistributableFirmware = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.consoleMode = "max";
  boot.loader.systemd-boot.editor = false;
  boot.loader.systemd-boot.memtest86.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [];

  # File systems
  fileSystems."/" =
    {
      device = "/dev/disk/by-label/NIXOS";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };
  swapDevices = [ { device = "/swapfile"; } ];

  # CPU
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
}
