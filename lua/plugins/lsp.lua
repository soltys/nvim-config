return {
    {
        "mason-org/mason.nvim",
        opts = {
            registries = {
                "github:mason-org/mason-registry",
                "github:crashdummyy/mason-registry",
            },
            ensure_installed = {
                "stylua",
                "shfmt",
                "roslyn",
                "lua-language-server",
                "powershell-editor-services",
                "rust-analyzer",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "powershell" })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        ---@type PluginLspOpts
        opts = {
            inlay_hints = { enabled = false },
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
