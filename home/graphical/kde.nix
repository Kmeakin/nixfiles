{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    arc-kde-theme
    arc-theme
    jumpapp
    libsForQt5.qtstyleplugin-kvantum
    papirus-icon-theme
  ];
}
