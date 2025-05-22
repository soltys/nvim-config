return {
    {
        "aaronik/treewalker.nvim",
        opts = {
            -- Whether to briefly highlight the node after jumping to it
            highlight = true,

            -- How long should above highlight last (in ms)
            highlight_duration = 250,

            -- The color of the above highlight. Must be a valid vim highlight group.
            -- (see :h highlight-group for options)
            highlight_group = "CursorLine",

            -- Whether the plugin adds movements to the jumplist -- true | false | 'left'
            --  true: All movements more than 1 line are added to the jumplist. This is the default,
            --        and is meant to cover most use cases. It's modeled on how { and } natively add
            --        to the jumplist.
            --  false: Treewalker does not add to the jumplist at all
            --  "left": Treewalker only adds :Treewalker Left to the jumplist. This is usually the most
            --          likely one to be confusing, so it has its own mode.
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
        "seblyng/roslyn.nvim",
        ft = "cs",
        ---@module 'roslyn.config'
        ---@type RoslynNvimConfig
        opts = {
            -- your configuration comes here; leave empty for default settings
            -- NOTE: You must configure `cmd` in `config.cmd` unless you have installed via mason
        },
    },
    {
        "stevearc/conform.nvim",
        ---@type conform.setupOpts
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
            },
            default_format_opts = { timeout_ms = 10000, lsp_format = "fallback" },
        },
    },
    {
        "folke/lazydev.nvim",
        dependencies = { { "soltys/wezterm-types", branch = "soltys-master", lazy = true } },
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "snacks.nvim", words = { "Snacks" } },
                { path = "wezterm-types", modes = { "wezterm" } },
            },
        },
    },
    { -- Autocompletion
        "saghen/blink.cmp",
        version = "1.*",
        dependencies = {
            "folke/lazydev.nvim",
        },
        --- @module 'blink.cmp'
        --- @type blink.cmp.Config
        opts = {},
    },
    { -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs", -- Sets main module to use for opts
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "diff",
                "html",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "c_sharp",
            },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = { enable = true },
        },
    },
}
