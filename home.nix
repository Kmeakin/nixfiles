{ pkgs, ... }: {
  home.packages = with pkgs; [
    firefox
    rnix-lsp
  ];

  programs.home-manager = {
    enable = true;
  };

  programs.vscode = {
    enable = true;
  };
}
