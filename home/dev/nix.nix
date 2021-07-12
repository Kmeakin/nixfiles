{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    rnix-lsp
    manix
    cachix
  ];

  programs.vscode.extensions = with pkgs.vscode-extensions; [
    jnoortheen.nix-ide
  ];


  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
