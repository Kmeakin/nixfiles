inputs @ { config, pkgs, ... }:
let
  symlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.file = {
    "${config.xdg.configHome}/zsh/rc.zsh".source = symlink ../../config/zsh/rc.zsh;
  };

  programs.zsh = {
    dotDir = inputs.lib.strings.removePrefix
      "${config.home.homeDirectory}/"
      "${config.xdg.configHome}/zsh";

    initExtra = "source ${config.xdg.configHome}/zsh/rc.zsh";

    enable = true;
    history = {
      path = "${config.xdg.dataHome}/zsh/history";
      save = 2147483647;
      size = 2147483647;
    };

    plugins = [
      {
        name = "zsh-completions";
        src = "${pkgs.zsh-completions}/share/zsh/site-functions";
      }
      {
        name = "zsh-history-search-multi-word";
        src = "${pkgs.zsh-history-search-multi-word}";
        file = "share/zsh/zsh-history-search-multi-word/history-search-multi-word.plugin.zsh";
      }
    ];

    enableVteIntegration = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
}
