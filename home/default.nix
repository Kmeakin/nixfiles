inputs @ { config, pkgs, ... }:
{
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.username = "karmea01";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "23.11";

  home.packages = [ ];
  home.sessionVariables = { };

  programs.git = {
    enable = true;
  };



  imports = [ ./neovim.nix ];
}
