inputs @ { pkgs, ... }:
{
  home.packages = [
    pkgs.bat
    pkgs.du-dust
    pkgs.eza
    pkgs.gnupg
    pkgs.jq
    pkgs.jumpapp
    pkgs.neofetch
    pkgs.nixpkgs-fmt
    pkgs.pass
    pkgs.ranger
    pkgs.ripgrep
  ];

  home.shellAliases = {
    grep = "grep --color=auto";
    igrep = "grep -i";
    rg = "rg --smart-case";

    eza = "eza --color=auto --icons --binary --git";
    ls = "eza";
    l = "ls -l";
    la = "ls -a";
    lal = "ls -la";
    lla = "ls -la";
    tree = "eza -T";
    cat = "bat --color=auto";
  };
}
