inputs @ { config, pkgs, ... }:
{
  home.packages = [ pkgs.pass ];
  home.sessionVariables = {
    PASSWORD_STORE_DIR = "${config.xdg.dataHome}/passwords";
  };
}
