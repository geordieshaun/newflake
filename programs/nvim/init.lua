require'nvim-tree'.setup {}

local opt = vim.opt
local g = vim.g

vim.cmd [[
    set nowrap
    set nobackup
    set nowritebackup
    set noerrorbells
    set noswapfile
]]

g.mapleader = ' '

-- Undo Files
opt.undofile = true
opt.undodir = "/home/shaun/.cache"

-- Indentation
opt.smartindent = true
opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Set clipboard to use system clipboard
opt.clipboard = "unnamedplus"

-- Use mouse
opt.mouse = "a"

-- Nicer UI Settings
opt.termguicolors = true
opt.cursorline = true
opt.number = true

-- Get rid of annoying viminfo file
opt.viminfo = ""
opt.viminfofile = "NONE"

-- QOL
opt.smartcase = true
opt.ttimeoutlen = 5
opt.compatible = false
opt.autoread = true
opt.incsearch = true
opt.hidden = true
opt.shortmess = "atI"

-- create rw dir for treesitters in nvim's cache dir
local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
vim.fn.mkdir(parser_install_dir, "p")
-- Prevents reinstall of treesitter plugins every boot
vim.opt.runtimepath:append(parser_install_dir)

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "all" },
    highlight = {
        enable = true,
    },
    parser_install_dir = parser_install_dir
}
