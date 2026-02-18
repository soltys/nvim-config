local map = vim.keymap.set
local del = vim.keymap.del

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- buffers
map("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

del("n", "gra")
del("n", "grr")
del("n", "grn")
del("n", "gri")
del("n", "grt")

map("n", "<leader>l", function() vim.cmd("Lazy") end, { desc = "Open Lazy" })
