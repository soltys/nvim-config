local incremental_selection = require("nvim-treesitter.incremental_selection")
vim.keymap.set("n", "<leader>cv", incremental_selection.init_selection, { desc = "Treesitter selection" })
vim.keymap.set("v", "<Tab>", incremental_selection.node_incremental, { desc = "Treesitter selection increment" })
vim.keymap.set("v", "<S-Tab>", incremental_selection.node_decremental, { desc = "Treesitter selection decrement" })

return {
  {
    "nvim-treesitter/nvim-treesitter",
    keys = {
      { "<Tab>", desc = "Increment Selection", mode = "x" },
      { "<S-Tab>", desc = "Decrement Selection", mode = "x" },
    },
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          node_incremental = "<Tab>",
          node_decremental = "<S-Tab>",
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<S-Tab>", desc = "Decrement Selection", mode = "x" },
        { "<Tab>", desc = "Increment Selection", mode = { "x" } },
      },
    },
  },
}
