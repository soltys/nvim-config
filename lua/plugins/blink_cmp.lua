return {
    "saghen/blink.cmp",
    ---@type blink.cmp.Config
    opts = {
        enabled = function()
            return not vim.tbl_contains({ "typr", "markdown" }, vim.bo.filetype)
        end,
    },

    keys = {
        {
            "<leader>uq",
            function()
                vim.g.cmp_disabled = not vim.g.cmp_disabled
                local msg = ""
                if vim.g.cmp_disabled == true then
                    msg = "Autocompletion (cmp) disabled"
                else
                    msg = "Autocompletion (cmp) enabled"
                end
                vim.notify(msg, vim.log.levels.INFO)
            end,
            noremap = true,
            silent = true,
            desc = "toggle autocompletion",
        },
    },
}
