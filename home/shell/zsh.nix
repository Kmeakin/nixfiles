{ config, lib, pkgs, aliases, ... }: {
  programs.zsh = {
    enable = true;
    dotDir = ".local/config/zsh";
    history = {
      path = "${config.xdg.dataHome}/zsh_history";
      save = 2147483647;
      size = 2147483647;
    };
    shellAliases = aliases;
    initExtra = ''source "$ZDOTDIR/rc.zsh"'';

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = "${pkgs.zsh-autosuggestions}";
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = "${pkgs.zsh-syntax-highlighting}";
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-completions";
        src = "${pkgs.zsh-completions}/share/zsh/site-functions";
      }
      {
        name = "zsh-history-search-multi-word";
        src = pkgs.fetchFromGitHub {
          owner = "zdharma";
          repo = "history-search-multi-word";
          rev = "f4efe71dbfae5f027c08f8ff8e8dca9bc946601c";
          sha256 = "/c6unIAoe5W0rnfskwBFHi5qD5IiKqx/9824xdOOEmw=";
        };
        file = "history-search-multi-word.plugin.zsh";
      }
    ];
  };
}
