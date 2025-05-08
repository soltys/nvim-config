return {
    { "williamboman/mason-lspconfig.nvim", version = "1.32.0" },
    {
        "williamboman/mason.nvim",
        version = "1.11.0",
        opts = {
            registries = {
                "github:mason-org/mason-registry",
                "github:crashdummyy/mason-registry",
            },
            ensure_installed = {
                "powershell-editor-services",
                "shfmt",
                "roslyn",
                "rust-analyzer",
                --- c/c++
                "cmakelang",
                "cmakelint",
                "neocmakelsp",
                --- markdown
                "markdown-toc",
                "markdownlint-cli2",
                "marksman",
                --- LUA
                "stylua",
                "lua-language-server",
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
