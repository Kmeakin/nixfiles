{ config, lib, myLib, pkgs, ... }: {
  programs.vscode = { enable = true; };

  symlinks.enable = true;
  symlinks.files."${config.xdg.configHome}/Code/User/settings.json" = "${myLib.dotfilesDir}/config/vscode/settings.json";
}
