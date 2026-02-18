return {
    -- Add C# to treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "c_sharp")
        end,
    },
    {
        "seblyng/roslyn.nvim",
        ft = "cs",
        opts = {},
    },
}
