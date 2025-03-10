return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "powershell" })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                powershell_es = {
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
                },
            },
        },
    },
}
