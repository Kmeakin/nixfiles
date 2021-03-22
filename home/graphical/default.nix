{ pkgs, ... }: {
  imports = [
    ./kde.nix
  ];

  home.packages = with pkgs; [
    discord
    firefox
    gwenview
    okular
    spotify
    thunderbird
    zoom-us
  ];
}
