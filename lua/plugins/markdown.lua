local HOME = os.getenv("USERPROFILE")
return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", HOME .. "/.markdownlint-cli2.yaml", "--" },
      },
    },
  },
}
