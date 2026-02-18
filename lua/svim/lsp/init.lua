local M = {}
function M.setup()
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("my.lsp", {}),
        callback = function(args)
            local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
            require("svim.lsp.keymaps").on_attach(client, args.buf)
            if
                not client:supports_method("textDocument/willSaveWaitUntil")
                and client:supports_method("textDocument/formatting")
            then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
                    buffer = args.buf,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                    end,
                })
            end
        end,
    })

    vim.lsp.enable("roslyn")
    vim.lsp.config("powershell_es", require("svim.lsp.powershell"))
    vim.lsp.enable("gopls")
    vim.lsp.enable("clangd")
    vim.lsp.enable("lua_ls")
end

return M
