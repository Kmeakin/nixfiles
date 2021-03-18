{ config, lib, myLib, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.Nix
      ms-vsliveshare.vsliveshare
    ] ++ (
      pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "nix-env-selector";
          publisher = "arrterian";
          version = "1.0.6";
          sha256 = "tOGsy4fm5KToKj3ci3LjAn5gwcI4WLt8MI7XCLMFZqY=";
        }
        {
          name = "discord-vscode";
          publisher = "icrawl";
          version = "5.4.0";
          sha256 = "yQwOlUK2Xifc0y1HIvyKss73OCxpZBKnTqMrNgT5YFo=";
        }
      ]
    );
  };
}
