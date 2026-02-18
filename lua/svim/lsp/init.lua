local M = {}
function M.setup()
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("my.lsp", {}),
        callback = function(args)
            local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
            require("svim.lsp.keymaps").on_attach(client, args.buf)
        end,
    })

    vim.lsp.enable("stylua")
    vim.lsp.enable("roslyn")
    vim.lsp.enable("powershell_es")
    vim.lsp.enable("gopls")
    vim.lsp.enable("clangd")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("ts_ls")
end

return M
