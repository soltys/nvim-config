return {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
        library = {
            -- Or relative, which means they will be resolved from the plugin dir.
            "lazy.nvim",
            -- always load the LazyVim library
            "LazyVim",
            "snacks.nvim",
        },
        -- always enable unless `vim.g.lazydev_enabled = false`
        -- This is the default
        enabled = function()
            return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
        end,
    },
}
