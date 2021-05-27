{ config, lib, pkgs, ... }: {
  home.sessionVariables = { EDITOR = "${pkgs.neovim}/bin/nvim"; };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraConfig = ''
      set nocompatible
      " Syntax highlighting
      filetype plugin on
      syntax on

      " Use system clipboard
      set clipboard=unnamedplus

      " Indentation
      filetype indent on

      " Line numbers
      set number

      " Set size of tabs to 4 spaces
      set tabstop=4
      set shiftwidth=4

      " Don't expand tab to spaces
      set expandtab!

      " Highlight search matches
      set hlsearch

      " Use incremental searching
      set incsearch

      " Ignore case in searches, unless the search pattern contains uppercase
      set ignorecase
      set smartcase

      " Copy indent from current line when starting a new line
      set autoindent

      " Auto-create directories for new files
      au BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
    '';
  };
}
