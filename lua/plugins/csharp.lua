if false then
  return {

    -- Add C# to treesitter
    {
      "nvim-treesitter/nvim-treesitter",
      opts = { ensure_installed = { "c_sharp" } },
    },
  }
else
  return {
    -- Add C# to treesitter
    {
      "nvim-treesitter/nvim-treesitter",
      opts = { ensure_installed = { "c_sharp" } },
    },

    {
      "seblj/roslyn.nvim",
      ft = "cs",
      opts = {
        filewatching = false,
        -- your configuration comes here; leave empty for default settings
      },
    },
  }
end
