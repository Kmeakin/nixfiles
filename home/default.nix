inputs @ { config, pkgs, ... }:
{
  # Basic stuff
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.username = "karmea01";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "23.11";

  home.sessionVariables = { };

  # CLI programs 
  programs.bash = {
    enable = true;
  };
  programs.git = {
    enable = true;
  };


  home.packages = with pkgs; [
    pkgs.bat
    pkgs.du-dust
    pkgs.eza
    pkgs.gnupg
    pkgs.jq
    pkgs.jumpapp
    pkgs.neofetch
    pkgs.nixpkgs-fmt
    pkgs.pass
    pkgs.ranger
  ];

  # Imports
  imports = [
    ./neovim.nix
    ./vscode.nix
    ./kde.nix
  ];
}
