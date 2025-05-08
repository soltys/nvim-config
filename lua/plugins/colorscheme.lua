return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        ---@type CatppuccinOptions
        opts = {
            flavour = "frappe",
            integrations = {
                blink_cmp = true,
                mason = true,
                snacks = { enabled = true },
                which_key = true,
            },
            custom_highlights = function(colors)
                return {
                    LineNr = { fg = colors.teal },
                    CursorLineNr = { fg = colors.red, style = { "bold" } },
                }
            end,
        },
    }
}
