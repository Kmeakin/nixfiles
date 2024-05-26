inputs @ { config, pkgs, ... }:
{
  home.packages = with pkgs; [
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

  programs.bash = {
    enable = true;
  };

  programs.git = {
    enable = true;
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
