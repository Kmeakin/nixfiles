{ config, lib, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
  home.sessionVariables = { EDITOR = "${pkgs.neovim}/bin/nvim"; };
}
