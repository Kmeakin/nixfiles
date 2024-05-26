inputs @ { config, pkgs, ... }:
{

  home.packages = [
    pkgs.okular
    pkgs.spectacle

    pkgs.arc-theme
    pkgs.arc-kde-theme
    pkgs.arc-icon-theme
    pkgs.papirus-icon-theme
  ];
}
