inputs @ { config, pkgs, ... }:
let
  symlink = config.lib.file.mkOutOfStoreSymlink;
  sonokai = {
    foreground = "#e1e3e4";
    background = "#2a2f38";
    cursor_bg = "#e1e3e4";
    cursor_border = "#e1e3e4";
    cursor_fg = "#e1e3e4";
    selection_bg = "#2a2f38";
    selection_fg = "#e1e3e4";
    scrollbar_thumb = "#828a9a";
    split = "#181a1c";
    ansi = [
      "#181a1c"
      "#ff6578"
      "#9dd274"
      "#eacb64"
      "#72cce8"
      "#ba9cf3"
      "#f69c5e"
      "#e1e3e4"
    ];
    brights = [
      "#828a9a"
      "#ff6578"
      "#9dd274"
      "#eacb64"
      "#72cce8"
      "#ba9cf3"
      "#f69c5e"
      "#e1e3e4"
    ];
  };
in
{
  programs.wezterm = {
    enable = true;
    colorSchemes = { "Sonokai Atlantis" = sonokai; };
    extraConfig = ''
      local config = require 'init'
      return config
    '';
  };

  home.file."${config.xdg.configHome}/wezterm/init.lua".source = symlink ../../config/wezterm/init.lua;
}
