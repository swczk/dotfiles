vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.o.termguicolors = true -- Fixes Notify opacity issues
vim.o.hlsearch = true -- Set highlight on search

-- Make line numbers default
-- vim.wo.number = true
vim.o.relativenumber = true

vim.o.mouse = "" -- Disable mouse mode
vim.o.breakindent = true -- Enable break indent
vim.o.undofile = true -- Save undo history

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme
--vim.cmd [[colorscheme onedark]]
--vim.cmd.colorscheme "catppuccin"

--vim.cmd()
vim.opt.clipboard = "unnamedplus"

vim.o.completeopt = "menuone,noselect" -- Set completeopt to have a better completion experience
vim.o.conceallevel = 2 -- Concealer for Neorg

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.api.nvim_create_autocmd("VimEnter",{callback=function()require"lazy".update({show = false,})end}) -- AutoUpdate Lazy on Enter Vim
