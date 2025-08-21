return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        ---@type CatppuccinOptions
        local opts = {
            float = {
                transparent = false, -- enable transparent floating windows
                solid = false, -- use solid styling for floating windows, see |winborder|
            },
            integrations = {
                blink_cmp = {
                    style = "bordered",
                },
                flash = true,
                mini = {
                    enabled = true,
                },
                noice = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                        ok = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                        ok = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                snacks = {
                    enabled = true,
                },
                which_key = true,
            },
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
