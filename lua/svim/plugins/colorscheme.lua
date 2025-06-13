return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        ---@type CatppuccinOptions
        local opts = {
            highlight_overrides = {
                frappe = function(frappe)
                    return {
                        LineNr = { fg = frappe.green },
                        CursorLineNr = { fg = frappe.red },
                    }
                end,
            },
        }
        require("catppuccin").setup(opts)
        -- setup must be called before loading
        vim.cmd.colorscheme(vim.g.colorscheme)
    end,
}
