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
        "mrcjkb/rustaceanvim",
        version = "^6", -- Recommended
        lazy = false, -- This plugin is already lazy
    },
    {
        "seblyng/roslyn.nvim",
        build = ":MasonInstall roslyn",
        ft = "cs",
        dependencies = {
            "mason-org/mason.nvim",
        },
        ---@module 'roslyn.config'
        ---@type RoslynNvimConfig
        opts = {
            -- ignores all targets, forces to manually choose target, stops auto launching roslnyn
            ignore_target = function(_)
                return true
            end,
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
        dependencies = { { "gonstoll/wezterm-types", lazy = true } },
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
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = "enter",
                ["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-u>"] = { "scroll_documentation_up", "fallback" },
                ["<C-d>"] = { "scroll_documentation_down", "fallback" },
            },
            cmdline = {
                enabled = true,
                completion = {
                    menu = { auto_show = true },
                    list = {
                        selection = { preselect = false },
                    },
                },
                keymap = {
                    preset = "enter",
                    ["<C-y>"] = { "show_and_insert" },
                    ["<CR>"] = { "accept_and_enter", "fallback" },
                    ["<Tab>"] = { "select_next", "fallback" },
                    ["<S-Tab>"] = { "select_prev", "fallback" },
                },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer", "lazydev" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100, -- show at a higher priority than lsp
                    },
                    lsp = {
                        fallbacks = { "buffer", "path" },
                    },
                    snippets = {
                        name = "Snippets",
                        module = "blink.cmp.sources.snippets",
                        min_keyword_length = 3,
                        opts = {
                            friendly_snippets = false,
                            search_paths = { vim.fn.stdpath("config") .. "/snippets/nvim" },
                        },
                    },
                },
            },
            completion = {
                accept = {
                    auto_brackets = {
                        enabled = false,
                    },
                },
                trigger = {
                    show_on_accept_on_trigger_character = false,
                },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false,
                    },
                },
                menu = {
                    draw = {
                        treesitter = { "lsp" },
                        columns = {
                            { "label", gap = 2 },
                            { "kind_icon", gap = 1, "kind" },
                        },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                    window = {
                        border = "none",
                        max_width = math.floor(vim.o.columns * 0.4),
                        max_height = math.floor(vim.o.lines * 0.5),
                    },
                },
            },
        },
        opts_extend = { "sources.default" },
    },
    {
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "master",
        build = ":TSUpdate",
        keys = {
            { "<Tab>", desc = "Increment Selection", mode = "x" },
            { "<S-Tab>", desc = "Decrement Selection", mode = "x" },
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                node_incremental = "<Tab>",
                node_decremental = "<S-Tab>",
            },
        },
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
                    "yaml",
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
        end,
    },
}
