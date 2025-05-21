vim.lsp.enable("lua_ls")
vim.lsp.enable("powershell_es")
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
