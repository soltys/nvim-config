return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        ---@type CatppuccinOptions
        local opts = {
            highlight_overrides = {
                frappe = function(frappe)
                    return {
                        LineNr = { fg = frappe.text },
                        CursorLineNr = { fg = frappe.red },
                    }
                end,
                mocha = function(frappe)
                    return {
                        LineNr = { fg = frappe.text },
                        CursorLineNr = { fg = frappe.red },
                    }
                end,
            },
        }
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin-mocha")
    end,
}
