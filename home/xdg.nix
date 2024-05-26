inputs @ { config, pkgs, ... }:
let
  home = config.home.homeDirectory;
in
{
  xdg.enable = true;
  xdg.cacheHome = "${home}/.local/var/cache";
  xdg.configHome = "${home}/.local/config";
  xdg.dataHome = "${home}/.local/share";

  xdg.userDirs.enable = true;
  xdg.userDirs.desktop = "${home}/usr/desktop";
  xdg.userDirs.documents = "${home}/usr/documents";
  xdg.userDirs.download = "${home}/usr/downloads";
  xdg.userDirs.music = "${home}/usr/music";
  xdg.userDirs.pictures = "${home}/usr/pictures";
  xdg.userDirs.publicShare = "${home}/usr/public";
  xdg.userDirs.templates = "${home}/usr/templates";
  xdg.userDirs.videos = "${home}/usr/videos";

  home.sessionVariables = {
    XDG_CACHE_HOME = "${config.xdg.cacheHome}";
    XDG_CONFIG_HOME = "${config.xdg.configHome}";
    XDG_DATA_HOME = "${config.xdg.dataHome}";

    XDG_DESKTOP_DIR = "${config.xdg.userDirs.desktop}";
    XDG_DOCUMENTS_DIR = "${config.xdg.userDirs.documents}";
    XDG_DOWNLOAD_DIR = "${config.xdg.userDirs.download}";
    XDG_MUSIC_DIR = "${config.xdg.userDirs.music}";
    XDG_PICTURES_DIR = "${config.xdg.userDirs.pictures}";
    XDG_PUBLICSHARE_DIR = "${config.xdg.userDirs.publicShare}";
    XDG_VIDEOS_DIR = "${config.xdg.userDirs.videos}";
  };
}
