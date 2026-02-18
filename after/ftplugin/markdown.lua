local map = vim.keymap.set
local opts = { noremap = true, silent = true, buffer = 0 }

map("n", "<leader>8", function()
    local line = vim.api.nvim_get_current_line()
    local trimmed = line:gsub("%s+$", "")

    if trimmed:len() > 0 and string.sub(trimmed, -1) ~= "*" then trimmed = "* " .. trimmed end
    vim.api.nvim_set_current_line(trimmed)
end, opts)
