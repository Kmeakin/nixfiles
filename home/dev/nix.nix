{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    rnix-lsp
    manix
  ];

  services.lorri.enable = true;
  programs.direnv = {
    enable = true;
    enableNixDirenvIntegration = true;
  };
}
