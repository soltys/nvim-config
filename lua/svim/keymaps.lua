local lib = require("svim.lib")
local map = vim.keymap.set

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
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

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- windows
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- treesitter
lib.on_load("nvim-treesitter", function()
    local incremental_selection = require("nvim-treesitter.incremental_selection")
    map("n", "<leader>cv", incremental_selection.init_selection, { desc = "Treesitter selection" })
    map("v", "<Tab>", incremental_selection.node_incremental, { desc = "Treesitter selection increment" })
    map("v", "<S-Tab>", incremental_selection.node_decremental, { desc = "Treesitter selection decrement" })
end)

-- stylua: ignore start
map("n", "<leader>fo", function() require('oil').open(vim.fn.getcwd()) end, { desc = "Open Oil"})
-- stylua: ignore end
