return {
    {
        "stevearc/conform.nvim",
        ---@type conform.setupOpts
        opts = {
            format_on_save = {
                timeout_ms = 10000,
                lsp_format = "fallback",
            },
            formatters = {
                jq = {
                    prepend_args = { "--indent", "4" },
                },
            },
            formatters_by_ft = {
                cmake = { "gersemi" },
                cpp = { "clang-format" },
                lua = { "stylua" },
                json = { "jq" },
                markdown = { "markdownlint-cli2" },
                toml = { "taplo" },
                -- xml = { "xmllint" },
            },
            default_format_opts = {
                timeout_ms = 10000,
                lsp_format = "fallback",
            },
        },
        config = function(_, opts)
            local conform = require("conform")
            conform.setup(opts)
            vim.keymap.set(
                "n",
                "<leader>cf",
                function() require("conform").format({ lsp_format = "fallback" }) end,
                { desc = "Format Code" }
            )
        end,
    },
    {
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "main",
        config = function()
            local opts = {
                highlight = { enable = true },
                indent = { enable = true },
            }
            local ts = require("nvim-treesitter")
            ts.setup(opts)
            ts.install({
                "bash",
                "c",
                "go",
                "diff",
                "html",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "c_sharp",
                "xml",
                "json",
                "jsonc",
                "yaml",
                "rust",
                "powershell",
                "vim",
                "vimdoc",
                "query",
                "regex",
            })
        end,
    },
}
