{ config, lib, myLib, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-vsliveshare.vsliveshare
      vscodevim.vim
    ] ++ (
      pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vspacecode";
          publisher = "vspacecode";
          version = "0.9.1";
          sha256 = "/qJKYXR0DznqwF7XuJsz+OghIBzdWjm6dAlaRX4wdRU=";
        }
        {
          name = "whichkey";
          publisher = "vspacecode";
          version = "0.8.4";
          sha256 = "cS8wFNJ5TTfj3eRxWLtYKyyGXoge1lv4SyvxjEAeHS4=";
        }
        {
          publisher = "bodil";
          name = "file-browser";
          version = "0.2.10";
          sha256 = "RW4vm0Hum9AeN4Rq7MSJOIHnALU0L1tBLKjaRLA2hL8=";
        }
        {
          publisher = "kahole";
          name = "magit";
          version = "0.6.7";
          sha256 = "rlQmvR2dlTzJj9lHYDSuLZXo40OMuu0sd/zY9epZXsY=";
        }
        {
          name = "material-theme";
          publisher = "zhuangtongfa";
          version = "3.9.15";
          sha256 = "q4pIZtCmQrTd7o5UQXBt/G31KDN3po53XxDnmWB7UVo=";
        }
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
