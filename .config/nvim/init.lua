require("keymaps")
require("options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	Show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
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

require("lazy").setup("plugins")

-- Start Neotree on Startup
--vim.api.nvim_create_autocmd("VimEnter", {
--	command = "set nornu nonu | Neotree toggle",
--})
--vim.api.nvim_create_autocmd("BufEnter", {
--	command = "set rnu nu",
--})
-- Start Neotree on Startup

-- Run gofmt on save
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').gofmt()
  end,
  group = format_sync_grp,
})

-- Run gofmt + goimports on save
local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})
