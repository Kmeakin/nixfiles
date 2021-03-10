{ config, lib, pkgs, ... }:
let
  myLib = {
    dotfilesDir = "/home/karl/git/me/nixfiles";
  };
in
{
  imports = lib.lists.map (module: import module { inherit config pkgs lib myLib; })
    [
      ./kde.nix
      ./shell.nix
      ./vscode.nix
      ./xdg.nix

      ./modules/symlink.nix
    ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "karl";
  home.homeDirectory = "/home/karl";
  home.stateVersion = "20.09";
}
