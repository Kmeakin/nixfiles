-- bootstrap lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- load plugins
require("lazy").setup({
    {
        "sainnhe/sonokai",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.sonokai_enable_italic = true
            vim.g.sonokai_style = "atlantis"
            vim.cmd.colorscheme("sonokai")
        end,
    },
    {
        -- override deletion operators to not overwrite clipbaord
        "gbprod/cutlass.nvim",
        opts = {
            -- make backspace leave the clipboard alone too
            override_del = true,
            -- use `x` to "cut" (delete and copy to clipboard)
            cut_key = "x", 
        },
    },
})

-- Copy indent from current line when starting a new line
vim.opt.autoindent = true

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Line numbers
vim.opt.number = true

-- Display tabs as 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Don't expand tabs to spaces
vim.opt.expandtab = false

-- Highlight search matches
vim.opt.hlsearch = true

-- Hightlight search matches as they are typed
vim.opt.incsearch = true

-- Ignore case in searches, unless the search pattern contains uppercase
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Allow moving the cursor past the end of the line
vim.opt.virtualedit = "all"
