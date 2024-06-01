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

  programs.git = {
    enable = true;
  };

  home.shellAliases = {
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

    eza = "eza --color=auto --icons --binary --git";
    ls = "eza";
    l = "ls -l";
    la = "ls -a";
    lal = "ls -la";
    lla = "ls -la";
    tree = "eza -T";
    cat = "bat --color=auto";
  };

  programs.alacritty = {
    enable = true;

    # Sonokai Atlantis
    # source: https://gist.github.com/sainnhe/e5c4512d5bcfcb46afd493beb86223c6
    settings.colors = {
      primary = {
        background = "0x2a2f38";
        foreground = "0xe1e3e4";
      };

      normal = {
        black = "0x181a1c";
        red = "0xff6578";
        green = "0x9dd274";
        yellow = "0xeacb64";
        blue = "0x72cce8";
        magenta = "0xba9cf3";
        cyan = "0xf69c5e";
        white = "0xe1e3e4";
      };

      bright = {
        black = "0x828a9a";
        red = "0xff6578";
        green = "0x9dd274";
        yellow = "0xeacb64";
        blue = "0x72cce8";
        magenta = "0xba9cf3";
        cyan = "0xf69c5e";
        white = "0xe1e3e4";
      };
    };
  };
}
