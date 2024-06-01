inputs @ { config, pkgs, ... }:
{

  programs.zsh = {
    enable = true;
    history = {
      path = "${config.xdg.dataHome}/zsh_history";
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
      {
        name = "pure";
        src = pkgs.fetchFromGitHub {
          owner = "sindresorhus";
          repo = "pure";
          rev = "HEAD";
          sha256 = "Hdb5wGVkNrmmVWZaKf3xUnNYsTX/8Bb7AhgLNJxNAUc=";
        };
        file = "pure.zsh";
      }
    ];

    enableVteIntegration = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
}
