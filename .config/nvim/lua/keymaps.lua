-- Smart Splits
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split", noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split", noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above split", noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split", noremap = true, silent = true })
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize split up", noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize split down", noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize split left", noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize split right", noremap = true, silent = true })
