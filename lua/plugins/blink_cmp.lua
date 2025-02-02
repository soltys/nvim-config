return {
    {
        "saghen/blink.cmp",
        --- @type blink.cmp.ConfigStrict
        opts = {
            enabled = function()
                return not vim.tbl_contains({ "markdown", "DressingInput" }, vim.bo.filetype)
                    and vim.bo.buftype ~= "prompt"
                    and vim.b.completion ~= false
            end,
            keymap = {
                preset = "super-tab",
            },
            sources = {
                -- add lazydev to your completion providers
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                },
            },
            completion = {
                list = {
                    selection = { preselect = true, auto_insert = true },
                },
            },
        },
    },
}
