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
        name = "zsh-autosuggestions";
        src = "${pkgs.zsh-autosuggestions}";
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
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
          rev = "HEAD";
          sha256 = "Lnn44a7WFaVeYplFvpfV88O37I5z1vPrxGW2enX5rE8=";
        };
        file = "history-search-multi-word.plugin.zsh";
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
    syntaxHighlighting.enable = true;
  };
}
