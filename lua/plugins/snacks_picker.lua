return {
  "folke/snacks.nvim",
  opts = {
    ---@type snacks.picker.Config
    picker = {
      ---@type  [string] snacks.picker.sources.Config | {}
      sources = {
        ---@type snacks.picker.grep.Config
        grep_xaml = {
          finder = "grep",
          format = "file",
          live = true, -- live grep by default
          ft = "xaml",
          supports_live = true,
        },
      },
    },
  },
}
