inputs @ { config, pkgs, ... }:
{

  programs.plasma = {
    enable = true;
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  home.packages = [
    pkgs.okular
    pkgs.spectacle

    pkgs.arc-theme
    pkgs.arc-kde-theme
    pkgs.arc-icon-theme
    pkgs.papirus-icon-theme
    pkgs.libsForQt5.qtstyleplugin-kvantum
    pkgs.libsForQt5.qt5ct
  ];
}
