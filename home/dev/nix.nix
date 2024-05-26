inputs @ { pkgs, ... }:
{
  programs.vscode = {
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ];
  };

  home.packages = [
    pkgs.nixd
  ];
}
