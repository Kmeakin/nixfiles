{ config, lib, pkgs, ... }:
let
  aliases = {
    gadd = "git add";
    gclone = "git clone";
    gcomm = "git commit -m";
    gcommit = "git commit";
    gdiff = "git diff";
    ginit = "git init";
    glog = "git log";
    gpull = "git pull";
    gpush = "git push";
    gstat = "git status";
    gstatus = "git status";

    grep = "grep --color=auto";
    igrep = "grep -i";
    rg = "rg --smart-case";

    exa = "exa --color=auto --icons --binary --git";
    ls = "exa";
    l = "exa -l";
    la = "exa -a";
    lal = "exa -la";
    lla = "exa -la";
    tree = "exa -T";
    cat = "bat --color=auto";
  };
in
{
  imports = lib.lists.map (module: import module { inherit config pkgs lib; })
    [
      ./git.nix
      ./pass.nix
    ];

  home.packages = with pkgs; [
    atool
    zip
    unzip

    bat
    dfc
    du-dust
    exa
    fd
    file
    htop
    neofetch
    onefetch
    ranger
    ripgrep
    tokei

    openconnect
  ];

  programs.command-not-found.enable = true;

  programs.bash = {
    enable = true;
    historyFile = "${config.xdg.dataHome}/bash_history";
    historyFileSize = 2147483647;
    historySize = 2147483647;
    shellAliases = aliases;
  };

  programs.zsh = {
    enable = true;
    history = {
      path = "${config.xdg.dataHome}/zsh_history";
      save = 2147483647;
      size = 2147483647;
    };
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
