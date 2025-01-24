if true then
  return {

    -- Add C# to treesitter
    {
      "nvim-treesitter/nvim-treesitter",
      opts = { ensure_installed = { "c_sharp" } },
    },
  }
end

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
      -- your configuration comes here; leave empty for default settings
    },
  },
}
