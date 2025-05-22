vim.lsp.config("*", {
    -- options for vim.diagnostic.config()
    ---@type vim.diagnostic.Opts
    diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = "●",
            -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
            -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
            -- prefix = "icons",
        },
        severity_sort = true,
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = "",
                [vim.diagnostic.severity.WARN] = "",
                [vim.diagnostic.severity.HINT] = "",
                [vim.diagnostic.severity.INFO] = "",
            },
        },
    },
    -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
    -- Be aware that you also will need to properly configure your LSP server to
    -- provide the inlay hints.
    inlay_hints = {
        enabled = true,
    },
    -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
    -- Be aware that you also will need to properly configure your LSP server to
    -- provide the code lenses.
    codelens = {
        enabled = true,
    },
    -- add any global capabilities here
    capabilities = {
        workspace = {
            fileOperations = {
                didRename = true,
                willRename = true,
            },
        },
    },
    format = {
        formatting_options = nil,
        timeout_ms = nil,
    },
})
vim.lsp.config("powershell_es", {
    bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
    filetypes = { "ps1", "psm1", "psd1" },
    settings = {
        powershell = {
            codeFormatting = {
                Preset = "OTBS",
                OpenBraceOnSameLine = true,
                NewLineAfterOpenBrace = true,
                IgnoreOneLineBlock = true,
                AlignPropertyValuePairs = true,
                PipelineIndentationStyle = "IncreaseIndentationForFirstPipeline",
                WhitespaceAroundOperator = true,
                WhitespaceAfterSeparator = true,
                WhitespaceInsideBrace = true,
            },
        },
    },
})
