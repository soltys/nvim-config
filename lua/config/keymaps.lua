-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<leader>aa", "mmgg0VGy`m", { desc = "yank all text" })

map("n", "<leader>ft", function()
    Snacks.terminal(nil, { cwd = vim.fn.expand("%:p:h") })
end, { desc = "Terminal (Current file dir)" })

map("n", "<leader>yydp", function()
    vim.fn.setreg("+", vim.fn.expand("%:p:h"))
end, { desc = "Copy directory path" })

map("n", "<leader>yyfn", function()
    vim.fn.setreg("+", vim.fn.expand("%:p:t"))
end, { desc = "Copy current file name" })
map("n", "<leader>yyfp", function()
    vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy current file name" })

map("n", "gl", function()
    require("flash").jump({
        search = { mode = "search", max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = "^",
    })
end, { desc = "Flash jump to to the line" })
