{ config, lib, pkgs, fenix, ... }: {
  imports = lib.lists.map (module: import module { inherit config pkgs fenix lib; })
    [
      ./dev
      ./editors
      ./graphical
      ./shell
      ./xdg.nix
    ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "karl";
  home.homeDirectory = "/home/karl";
  home.stateVersion = "21.05";
}
