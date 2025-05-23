vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.ERROR] = " ",
        },
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
