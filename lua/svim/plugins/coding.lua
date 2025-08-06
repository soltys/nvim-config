return {
    {
        "aaronik/treewalker.nvim",
        opts = {
            highlight = true,
            highlight_duration = 250,
            highlight_group = "CursorLine",
            jumplist = true,
        },
        keys = {
            -- swapping
            { "<C-S-k>", "<cmd>Treewalker SwapUp<cr>", mode = { "n" }, silent = true },
            { "<C-S-j>", "<cmd>Treewalker SwapDown<cr>", mode = { "n" }, silent = true },
            { "<C-S-h>", "<cmd>Treewalker SwapLeft<cr>", mode = { "n" }, silent = true },
            { "<C-S-l>", "<cmd>Treewalker SwapRight<cr>", mode = { "n" }, silent = true },
            -- movement
            { "<C-k>", "<cmd>Treewalker Up<cr>", mode = { "n", "v" }, silent = true },
            { "<C-j>", "<cmd>Treewalker Down<cr>", mode = { "n", "v" }, silent = true },
            { "<C-h>", "<cmd>Treewalker Left<cr>", mode = { "n", "v" }, silent = true },
            { "<C-l>", "<cmd>Treewalker Right<cr>", mode = { "n", "v" }, silent = true },
        },
    },
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
            },
            default_format_opts = {
                timeout_ms = 10000,
                lsp_format = "fallback",
            },
        },
        config = function(_, opts)
            local conform = require("conform")
            conform.setup(opts)
            vim.keymap.set("n", "<leader>cf", function()
                require("conform").format({ lsp_format = "fallback" })
            end, { desc = "Format Code" })
        end,
    },
    {
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "master",
        config = function()
            local opts = {
                ensure_installed = {
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
                },
                -- Auto install languages that are not installed
                auto_install = true,
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
            }
            local configs = require("nvim-treesitter.configs")
            configs.setup(opts)

            local map = vim.keymap.set
            local incremental_selection = require("nvim-treesitter.incremental_selection")
            map("n", "<Tab>", incremental_selection.init_selection, { desc = "Treesitter selection" })
            map("v", "<Tab>", incremental_selection.node_incremental, { desc = "Treesitter selection increment" })
            map("v", "<S-Tab>", incremental_selection.node_decremental, { desc = "Treesitter selection decrement" })
        end,
    },
}
