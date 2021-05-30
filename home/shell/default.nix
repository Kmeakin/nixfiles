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
  imports = lib.lists.map (module: import module { inherit config pkgs lib aliases; })
    [
      ./git.nix
      ./pass.nix
      ./bash.nix
      ./zsh.nix
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
  ];

  programs.command-not-found.enable = true;

}
