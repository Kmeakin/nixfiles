inputs @ { config, pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
