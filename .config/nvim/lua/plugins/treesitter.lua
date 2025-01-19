return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"bash",
				"c",
				"c_sharp",
				"cpp",
				"css",
				"dockerfile",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
        "go",
				"html",
				"http",
				"javascript",
				"json",
				"latex",
				"lua",
				"nix",
				"pascal",
				"regex",
				"rust",
				"sql",
				"toml",
				"yaml",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
