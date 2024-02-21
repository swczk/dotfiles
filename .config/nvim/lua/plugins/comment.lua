return {
	"numToStr/Comment.nvim",
	opts = {
		padding = true,
	},
	lazy = false,

	vim.keymap.set("n", "<leader>/",
		function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
		{ desc = "Toggle comment line", noremap = true, silent = true }),
	vim.keymap.set("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
		{ desc = "Toggle comment for selection", noremap = true, silent = true })
}
