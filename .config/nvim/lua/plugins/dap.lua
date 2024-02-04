return {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
			ensure_installed = {
				"codelldb",
			},
		},
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = "mfussenegger/nvim-dap",
		config = function(_, opts)
			require("dap-go").setup(opts)
			require("dapui").setup()
			require("nvim-dap-virtual-text").setup()
			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = " ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)

			-- Debugger
			vim.api.nvim_set_keymap("n", "<leader>dt", ":DapUiToggle<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
			vim.api.nvim_set_keymap(
				"n",
				"<leader>dr",
				":lua require('dapui').open({reset = true})<CR>",
				{ noremap = true }
			)
			vim.api.nvim_set_keymap("n", "<leader>m", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true })
			vim.api.nvim_set_keymap(
				"n",
				"<leader>ht",
				":lua require('harpoon.ui').toggle_quick_menu()<CR>",
				{ noremap = true }
			)
		end,
	},
	"theHamsta/nvim-dap-virtual-text",

	config = function()
		require("dapui").setup()
		require("dap-go").setup()
		require("nvim-dap-virtual-text").setup()
		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = " ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)

		-- Debugger
		vim.api.nvim_set_keymap("n", "<leader>dt", ":DapUiToggle<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>m", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true })
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ht",
			":lua require('harpoon.ui').toggle_quick_menu()<CR>",
			{ noremap = true }
		)
	end,
}
