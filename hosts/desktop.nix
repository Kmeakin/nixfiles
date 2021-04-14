{ config, lib, pkgs, ... }: {
  imports = [ ./common.nix ];

  networking.hostName = "Desktop";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.consoleMode = "max";
  boot.loader.systemd-boot.editor = false;
  boot.loader.systemd-boot.memtest86.enable = true;

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

  programs.steam.enable = true;

  # CPU
  powerManagement.cpuFreqGovernor = "performance";

  # GPU
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}
