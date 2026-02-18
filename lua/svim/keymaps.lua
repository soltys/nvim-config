local map = vim.keymap.set
local del = vim.keymap.del

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("n", "<M-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<M-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<M-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<M-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", function()
    Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function()
    Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- windows
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

del("n", "gra")
del("n", "grr")
del("n", "grn")
del("n", "gri")
del("n", "grt")
