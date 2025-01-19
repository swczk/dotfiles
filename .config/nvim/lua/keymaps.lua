local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Command --
-- Menu navigation
keymap("c", "<C-j>",  'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } )
keymap("c", "<C-k>",  'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } )

-- Comment
-- if is_available "Comment.nvim" then
-- 	vim.keymap.set("n", "<leader>/", function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end, { desc = "Toggle comment line", noremap = true, silent = true })
-- 	vim.keymap.set("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", { desc = "Toggle comment for selection", noremap = true, silent = true })
-- end

-- Telescope
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true })

-- LSP
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })

-- Smart Splits
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split", noremap = true, silent = true })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split", noremap = true, silent = true })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above split", noremap = true, silent = true })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split", noremap = true, silent = true })
-- vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize split up", noremap = true, silent = true })
-- vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize split down", noremap = true, silent = true })
-- vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize split left", noremap = true, silent = true })
-- vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize split right", noremap = true, silent = true })
