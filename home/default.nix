inputs @ { ... }:

let
  config = inputs.config;

in

{
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.username = "karmea01";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "23.11";

  home.packages = [ ];
  home.sessionVariables = { };
}
