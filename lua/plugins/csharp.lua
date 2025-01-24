return {
  -- Add C# to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "c_sharp")
    end,
  },

  {
    "seblj/roslyn.nvim",
    ft = "cs",
    opts = {
      filewatching = true,
      -- your configuration comes here; leave empty for default settings
    },
  },
  --    {
  --      "nvim-neotest/neotest",
  --      dependencies = { "Issafalcon/neotest-dotnet" },
  --      opts = {
  --        adapters = {
  --          "neotest-dotnet",
  --        },
  --      },
  --    },
}
