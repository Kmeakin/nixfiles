{ pkgs, ... }: {
  imports = [
    ./kde.nix
  ];

  home.packages = with pkgs; [
    (discord.override { nss = pkgs.nss; })
    firefox
    gwenview
    okular
    spotify
    thunderbird
    zoom-us
  ];
}
