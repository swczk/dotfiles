return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"clang-format",
				"codelldb",
				"eslint-lsp",
				"gopls",
				"typescript-language-server",
				"tailwindcss-language-server",
			},
		},
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
	--		local util = require("lspconfig/util")

			local servers = { "html", "lua_ls", "tsserver", "tailwindcss", "eslint" }

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end

--			lspconfig.gopls.setup({
--				on_attach = on_attach,
--				capabilities = capabilities,
--				cmd = { "gopls" },
--				filetypes = { "go", "gomod", "gowork", "gotmpl" },
--				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--				settings = {
--					gopls = {
--						completeUnimported = true,
--						usePlaceholders = true,
--						analyses = {
--							unusedparams = true,
--						},
--					},
--				},
--			})

			-- LSP
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
		end,
	},
}
