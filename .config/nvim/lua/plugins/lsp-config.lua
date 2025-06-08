return {
	{
		"williamboman/mason.nvim",
		opts = {},
		lazy = false,
		config = function()
			require("mason").setup({
				ensure_installed = {
					"lua_ls",
					"ansiblels",
					"bashls",
					"cssls",
					"dockerls",
					"docker_compose_language_service",
					"gopls",
					"html",
					"jsonls",
					"marksman",
					"omnisharp",
					"rnix",
					"rust-analyzer",
					"sqlls",
					"ts_ls",
				},
				check_outdated_packages_on_open = true,
				ui = {
					border = 0.5,
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
				keymaps = {
					toggle_package_expand = "<CR>",
					install_package = "i",
					update_package = "u",
					check_package_version = "c",
					update_all_packages = "U",
					check_outdated_packages = "C",
					uninstall_package = "x",
					cancel_installation = "<C-c>",
					apply_language_filter = "<C-f>",
					toggle_package_install_log = "<CR>",
					toggle_help = "?",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ansiblels",
					"bashls",
					"cssls",
					"dockerls",
					"docker_compose_language_service",
					-- "gopls",
					"html",
					"jsonls",
					"marksman",
					-- "omnisharp",
					"rnix",
					-- "rust_analyzer",
					"sqlls",
					"ts_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			local util = require("lspconfig/util")

			local servers = {
				"lua_ls",
				"eslint",
				"ansiblels",
				"bashls",
				"cssls",
				"dartls",
				"dockerls",
				"docker_compose_language_service",
				"html",
				"jsonls",
				"ts_ls",
				"marksman",
				"rnix",
				"sqlls",
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end

			lspconfig.omnisharp.setup({
				capabilities = capabilities,
				cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
				enable_import_completion = true,
				organize_imports_on_format = true,
				enable_roslyn_analyzers = true,
				root_dir = function()
					return vim.loop.cwd() -- current working directory
				end,
			})

			lspconfig.gopls.setup({
				cmd = { "gopls" },
				capabilities = capabilities,
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
        		root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						experimentalPostfixCompletions = true,
            		completeUnimported = true,
            		usePlaceholders = true,
						analyses = {
							unusedparams = true,
							shadow = true,
						},
						staticcheck = true,
					},
				},
				on_attach = on_attach,
			})

			lspconfig.rust_analyzer.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "rust" },
				root_dir = util.root_pattern("Cargo.toml"),
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			})

			-- LSP
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
		end,
	},
}
