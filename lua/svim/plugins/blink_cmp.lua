return { -- Autocompletion
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
        "folke/lazydev.nvim",
        "nvim-mini/mini.nvim",
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        signature = {
            enabled = true,
        },
        fuzzy = {
            prebuilt_binaries = {
                extra_curl_args = { "--insecure" },
            },
        },
        keymap = {
            preset = "enter",
            ["<C-e>"] = { "select_and_accept", "fallback" },
            ["<Tab>"] = { "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "snippet_backward", "fallback" },
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
                ["<C-e>"] = { "select_and_accept", "fallback" },
                ["<CR>"] = { "accept_and_enter", "fallback" },
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
            },
        },
        snippets = { preset = "mini_snippets" },
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
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                local icon = ctx.kind_icon
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                                    if dev_icon then icon = dev_icon end
                                else
                                    icon = require("svim.lsp.lspkind").symbolic(ctx.kind, {
                                        mode = "symbol",
                                    })
                                end

                                return icon .. ctx.icon_gap
                            end,

                            -- Optionally, use the highlight groups from nvim-web-devicons
                            -- You can also add the same function for `kind.highlight` if you want to
                            -- keep the highlight groups in sync with the icons.
                            highlight = function(ctx)
                                local hl = ctx.kind_hl
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                                    if dev_icon then hl = dev_hl end
                                end
                                return hl
                            end,
                        },
                    },
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
}
