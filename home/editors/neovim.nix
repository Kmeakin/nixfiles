inputs @ { config, pkgs, ... }:
let
  symlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];
  };

  # for clipboard support
  home.packages = [ pkgs.xclip pkgs.xsel ];

  home.file = {
    "${config.xdg.configHome}/nvim/init.lua".source = symlink ../../config/neovim/init.lua;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
