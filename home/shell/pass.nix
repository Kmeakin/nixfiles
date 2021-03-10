{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [];

  programs.password-store = {
    enable = true;

  };

  home.sessionVariables = {
    PASSWORD_STORE_DIR = "${config.xdg.configHome}";
  };
}
