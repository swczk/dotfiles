vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Set SwapFiles off
vim.cmd("set noswapfile")

vim.opt.termguicolors = true -- Fixes Notify opacity issues
vim.opt.hlsearch = true -- Set highlight on search

-- Make line numbers default
-- vim.wo.number = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "" -- Disable mouse mode
vim.opt.breakindent = true -- Enable break indent
vim.opt.undofile = true -- Save undo history

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme
--vim.cmd [[colorscheme onedark]]
--vim.cmd.colorscheme "catppuccin"

--vim.cmd()
vim.opt.clipboard = "unnamedplus"

vim.opt.completeopt = "menuone,noselect" -- Set completeopt to have a better completion experience
vim.opt.conceallevel = 2 -- Concealer for Neorg

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.api.nvim_create_autocmd("VimEnter",{callback=function()require"lazy".update({show = false,})end}) -- AutoUpdate Lazy on Enter Vim
