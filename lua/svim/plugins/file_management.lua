local lib = require("svim.lib")
return {
    {
        "stevearc/oil.nvim",
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
        config = function(opts)
            require("oil").setup(opts)
            lib.on_load("mini.surround", function()
                vim.schedule(function()
                    require("which-key").add({
                        {
                            "<leader>fo",
                            function()
                                require("oil").open(vim.fn.getcwd())
                            end,
                            desc = "Open Oil",
                            icon = "󰏇",
                        },
                    })
                end)
            end)
        end,
    },
}
