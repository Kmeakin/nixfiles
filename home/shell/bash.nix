{ config, lib, pkgs, aliases, ... }: {
  programs.bash = {
    enable = true;
    historyFile = "${config.xdg.dataHome}/bash_history";
    historyFileSize = 2147483647;
    historySize = 2147483647;
    shellAliases = aliases;
  };

  programs.readline = {
    enable = true;
    # TODO
    # inputrcFile = "${config.xdg.configHome}/readline/inputrc";
    variables = {
      editing-mode = "vi";
      show-mode-in-prompt = true;

      # TODO: explain what these do (see arch wiki)
      show-all-if-unmodified = true;
      show-all-if-ambiguous = true;
      completion-ignore-case = true;
      visible-stats = true;
      colored-stats = true;
      mark-symlinked-directories = true;
      colored-completion-prefix = true;
      menu-complete-display-prefix = true;
    };

    bindings = {
      # bind ctrl+j to "cd into parent directory"
      # C-u: delete to beginning of line
      # cd ..: enter verbatim "cd .."
      # C-j: enter
      "\\C-h" = ''"\C-u cd .. \C-j"'';
    };

    extraConfig = ''
      $if term=linux
      	set vi-ins-mode-string (ins)\1\e[?0c\2
      	set vi-cmd-mode-string (cmd)\1\e[?8c\2
      $else
      	set vi-ins-mode-string (ins)\1\e[6 q\2
      	set vi-cmd-mode-string (cmd)\1\e[2 q\2
      $endif
    '';
  };
}
