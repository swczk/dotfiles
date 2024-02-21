return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			-- GitSigns
			vim.keymap.set("n", "]g", function() require("gitsigns").next_hunk() end, { desc = "Next Git hunk", noremap = true, silent = true })
			vim.keymap.set("n", "[g", function() require("gitsigns").prev_hunk() end, { desc = "Previous Git hunk", noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gl", function() require("gitsigns").blame_line() end, { desc = "View Git blame", noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gL", function() require("gitsigns").blame_line { full = true } end, { desc = "View full Git blame", noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gp", function() require("gitsigns").preview_hunk() end, { desc = "Preview Git hunk", noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gh", function() require("gitsigns").reset_hunk() end, { desc = "Reset Git hunk", noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gr", function() require("gitsigns").reset_buffer() end, { desc = "Reset Git buffer", noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gs", function() require("gitsigns").stage_hunk() end, { desc = "Stage Git hunk", noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gS", function() require("gitsigns").stage_buffer() end, { desc = "Stage Git buffer", noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, { desc = "Unstage Git hunk", noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gd", function() require("gitsigns").diffthis() end, { desc = "View Git diff", noremap = true, silent = true })
		end,
	},
}
