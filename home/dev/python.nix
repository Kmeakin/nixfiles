{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    python3
    black
    python3Packages.pylama
  ];

  programs.vscode.extensions = with pkgs.vscode-extensions; [
    ms-python.python
  ];
}
