return {
    {
        "saghen/blink.cmp",
        --- @type blink.cmp.ConfigStrict
        opts = {
            enabled = function()
                return not vim.tbl_contains({ "lua", "markdown" }, vim.bo.filetype)
                    and (not vim.tbl_contains({ "prompt", "typr" }, vim.bo.buftype))
                    and vim.b.completion ~= false
            end,
            keymap = {
                preset = "enter",
                ["<Tab>"] = {
                    function(cmp)
                        if cmp.snippet_active() then
                            return cmp.accept()
                        else
                            return cmp.select_and_accept()
                        end
                    end,
                    "snippet_forward",
                    "fallback",
                },
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
                    selection = { preselect = false },
                },
            },
        },
    },
}
