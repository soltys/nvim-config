return {
  {
    "saghen/blink.cmp",
    opts = {
      enabled = function()
        return not vim.tbl_contains({ "markdown", "DressingInput" }, vim.bo.filetype)
          and vim.bo.buftype ~= "prompt"
          and vim.b.completion ~= false
      end,
      sources = {
        default = { "lsp", "path", "snippets" },
      },
      keymap = {
        preset = "super-tab",
      },
      completion = {
        list = {
          selection = { preselect = true, auto_insert = true },
        },
      },
    },
  },
}
