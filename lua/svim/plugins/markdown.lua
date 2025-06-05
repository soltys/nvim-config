return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you use the mini.nvim suite
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            enabled = true,
            completions = {
                -- Settings for blink.cmp completions source
                blink = { enabled = false },
            },
            code = {
                enabled = true,
            },
        },
    },
}
