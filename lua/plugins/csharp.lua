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
        opts = {
            filewatching = true,
            ignore_target = function(target)
                return string.match(target, "Phoenix.sln") ~= nil
            end,
            -- your configuration comes here; leave empty for default settings
        },
    },
}
