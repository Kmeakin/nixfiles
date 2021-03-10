{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [];

  programs.password-store = {
    enable = true;
  };

  home.sessionVariables = {
    PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
    GNUPGHOME = "${config.xdg.dataHome}/gnupg";
  };

  programs.git.extraConfig = {
    credential = {
      helper = "${pkgs.gitAndTools.pass-git-helper}/bin/pass-git-helper";
    };
  };

  xdg.configFile."pass-git-helper/git-pass-mapping.ini".text = lib.generators.toINI {} {
    DEFAULT.skip_username = 7;
    "github.com".target = "github.com";
    "gitlab.com".target = "gitlab.com";
    "gitlab.cs.man.ac.uk".target = "manchester.ac.uk";
  };
}
