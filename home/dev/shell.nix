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

    ls = "exa --color=auto";
    cat = "bat --color=auto";
  };
in
{
  home.packages = with pkgs; [
    bat
    dfc
    du-dust
    exa
    fd
    file
    htop
    neofetch
    ranger
    ripgrep
    tokei
  ];

  programs.bash = {
    enable = true;
    historyFile = "${config.xdg.dataHome}/bash/bash_history";
    historyFileSize = 2147483647;
    historySize = 2147483647;
    shellAliases = aliases;
  };

  programs.zsh = {
    enable = true;
    history = {
      path = "${config.xdg.dataHome}/zsh/zsh_history";
      save = 2147483647;
      size = 2147483647;
    };
    shellAliases = aliases;
  };
}
