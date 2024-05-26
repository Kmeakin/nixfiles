{ config, pkgs, lib, ... }:

{
  imports = [ ./common.nix ];

  networking.hostName = "ThinkPad-P1";
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "23.11";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel
  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  # Partitions
  fileSystems."/" = {
    device = "/dev/nvme1n1p3";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/nvme1n1p1";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  # Users
  users.users."karmea01" = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  # Networking
  networking.networkmanager.enable = true;
  networking.useDHCP = lib.mkDefault true;

  # Audio
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # X11
  services.xserver.enable = true;
  services.xserver.xkb.layout = "gb";
  services.xserver.xkb.options = "terminate:ctrl_alt_bksp, ctrl:ralt_rctrl";
  services.libinput.enable = true;

  # KDE
  services.xserver.desktopManager.plasma5.enable = true;
  services.displayManager.sddm.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code
    fira-code-symbols
  ];
}
