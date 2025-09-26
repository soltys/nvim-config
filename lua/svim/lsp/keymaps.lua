local M = {}
local keymaps = {
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

    { "<leader>cl", function() Snacks.picker.lsp_config() end, desc = "Lsp Info" },
    { "K", function() return vim.lsp.buf.hover() end, desc = "Hover" },
    { "gK", function() return vim.lsp.buf.signature_help() end, desc = "Signature Help", has = "signatureHelp" },
    { "gk", function() return vim.lsp.buf.signature_help() end, desc = "Signature Help", has = "signatureHelp" },
    {
        "<c-k>",
        function() return vim.lsp.buf.signature_help() end,
        mode = "i",
        desc = "Signature Help",
        has = "signatureHelp",
    },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
    { "<leader>cc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "v" }, has = "codeLens" },
    { "<leader>cC", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens", mode = { "n" }, has = "codeLens" },
    {
        "<leader>cR",
        function() Snacks.rename.rename_file() end,
        desc = "Rename File",
        mode = { "n" },
        has = { "workspace/didRenameFiles", "workspace/willRenameFiles" },
    },
    { "<leader>cr", vim.lsp.buf.rename, desc = "Rename", has = "rename" },
    -- { "<leader>cf", function() vim.lsp.buf.format() end, desc = "Format code"},
    --{ "<leader>cA", LazyVim.lsp.action.source, desc = "Source Action", has = "codeAction" },
    {
        "]]",
        function() Snacks.words.jump(vim.v.count1) end,
        has = "documentHighlight",
        desc = "Next Reference",
        cond = function() return Snacks.words.is_enabled() end,
    },
    {
        "[[",
        function() Snacks.words.jump(-vim.v.count1) end,
        has = "documentHighlight",
        desc = "Prev Reference",
        cond = function() return Snacks.words.is_enabled() end,
    },
    {
        "<a-n>",
        function() Snacks.words.jump(vim.v.count1, true) end,
        has = "documentHighlight",
        desc = "Next Reference",
        cond = function() return Snacks.words.is_enabled() end,
    },
    {
        "<a-p>",
        function() Snacks.words.jump(-vim.v.count1, true) end,
        has = "documentHighlight",
        desc = "Prev Reference",
        cond = function() return Snacks.words.is_enabled() end,
    },
}

function M.has(buffer, method)
    if type(method) == "table" then
        for _, m in ipairs(method) do
            if M.has(buffer, m) then return true end
        end
        return false
    end
    method = method:find("/") and method or "textDocument/" .. method
    local clients = vim.lsp.get_clients({ bufnr = buffer })
    for _, client in ipairs(clients) do
        if client:supports_method(method, buffer) then return true end
    end
    return false
end

function M.on_attach(_, buffer)
    for _, keys in pairs(keymaps) do
        local has = not keys.has or M.has(buffer, keys.has)
        local cond = not (keys.cond == false or ((type(keys.cond) == "function") and not keys.cond()))

        if has and cond then vim.keymap.set(keys.mode or "n", keys[1], keys[2], { desc = keys.desc }) end
    end
end
return M
