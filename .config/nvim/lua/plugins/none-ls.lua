return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
	},
	event = "VeryLazy",
	config = function()
		local null_ls = require("null-ls")
		--    local functions = require("null-ls.config").setup()
		--    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.eslint_d,
				--        null_ls.builtins.formatting.gofumpt,
				--        null_ls.builtins.formatting.goimports_reviser,
				--        null_ls.builtins.formatting.golines,
			},
			--      on_attach = function(client, bufnr)
			--        if client.supports_method("textDocument/formatting") then
			--          vim.api.nvim_clear_autocmds({
			--            group = augroup,
			--            buffer = bufnr,
			--          })
			--          vim.api.nvim_create_autocmd("BufWritePre", {
			--            group = augroup,
			--            buffer = bufnr,
			--            callback = function()
			--              vim.lsp.buf.formatting({ bufnr = bufnr })
			--            end,
			--          })
			--        end
			--      end,
		})

		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { noremap = true, silent = true })
	end,
}
