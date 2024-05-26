inputs @ { config, pkgs, ... }:
{
  # Basic stuff
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.username = "karmea01";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "23.11";

  home.sessionVariables = { };

  home.packages = [
    pkgs.discord
    pkgs.firefox
    pkgs.spotify
    pkgs.zoom-us
  ];

  # Imports
  imports = [
    ./kde.nix
    ./shell.nix
    ./xdg.nix

    ./editors/neovim.nix
    ./editors/vscode.nix

    ./dev/c.nix
    ./dev/nix.nix
    ./dev/rust.nix
  ];
}
