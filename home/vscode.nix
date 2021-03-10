{ config, lib, myLib, pkgs, ... }: {
  programs.vscode = { enable = true; 
  extensions = with pkgs.vscode-extensions; [
    bbenoist.Nix
    ms-vsliveshare.vsliveshare
  ];
  };
}
