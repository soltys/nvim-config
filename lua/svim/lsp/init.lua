local M = {}
function M.setup()
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("my.lsp", {}),
        callback = function(args)
            local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
            require("svim.lsp.keymaps").on_attach(client, args.buf)
        end,
    })

    vim.lsp.enable("roslyn")
    vim.lsp.config("powershell_es", require("svim.lsp.powershell"))
    vim.lsp.enable("gopls")
    vim.lsp.enable("clangd")
    vim.lsp.enable("lua_ls")
end

return M
