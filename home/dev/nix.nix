{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    rnix-lsp
    manix
  ];

  programs.direnv = {
    enable = true;
    enableNixDirenvIntegration = true;
  };
}
