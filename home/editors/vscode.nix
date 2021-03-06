{ config, lib, myLib, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
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
          version = "0.8.6";
          sha256 = "FyRPII+9/tizNOITtIYF59YM0xsIQxpwe7z+Ch9HZzM=";
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
          version = "1.0.7";
          sha256 = "DnaIXJ27bcpOrIp1hm7DcrlIzGSjo4RTJ9fD72ukKlc=";
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
