inputs @ { config, pkgs, ... }:
{
  home.packages = [ pkgs.pass ];
  home.sessionVariables = {
    PASSWORD_STORE_DIR = "${config.xdg.dataHome}/passwords";
  };

  programs.git.extraConfig = {
    credential = {
      helper = "${pkgs.gitAndTools.pass-git-helper}/bin/pass-git-helper";
    };
  };

  xdg.configFile."pass-git-helper/git-pass-mapping.ini".text = inputs.lib.generators.toINI { } {
    DEFAULT.skip_username = inputs.lib.stringLength "login: ";
    "github.com".target = "github-cli";
    "gitlab.com".target = "gitlab.com";
  };
}
