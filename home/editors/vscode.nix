inputs @ { config, pkgs, ... }:
let
  symlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      vspacecode.whichkey
      vspacecode.vspacecode
      bodil.file-browser
      kahole.magit

      jnoortheen.nix-ide
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
      name = "sonokai";
      publisher = "sainnhe";
      version = "0.2.9";
      sha256 = "5b3XPCH6h8FYVyn6Iws2j7lIwHSaQE5glaBnmhGErIk=";
    }];
  };

  home.file = {
    "${config.xdg.configHome}/Code/User/settings.json".source = symlink ../../config/vscode/settings.jsonc;
    "${config.xdg.configHome}/Code/User/keybindings.json".source = symlink ../../config/vscode/keybindings.jsonc;
  };
}
