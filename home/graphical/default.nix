{ pkgs, ... }: {
  imports = [
    ./kde.nix
  ];

  home.packages = with pkgs; [
    discord
    spotify
    okular
    thunderbird
    firefox
    gwenview
  ];
}
