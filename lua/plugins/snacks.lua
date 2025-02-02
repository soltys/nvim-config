return {
    "folke/snacks.nvim",
    opts = {
        scratch = {
            enabled = true,
        },
        ---@type snacks.picker.Config
        picker = {
            win = {
                input = {
                    keys = {
                        ["C-e"] = { "confirm", mode = { "n", "i" } },
                    },
                },
                list = {
                    keys = {
                        ["C-e"] = { "confirm" },
                    },
                },
            },
            ---@type  [string] snacks.picker.sources.Config | {}
            sources = {
                ---@type snacks.picker.grep.Config
                grep_xaml = {
                    finder = "grep",
                    format = "file",
                    live = true, -- live grep by default
                    ft = "xaml",
                    supports_live = true,
                    show_empty = true,
                },
            },
        },
    },
}
