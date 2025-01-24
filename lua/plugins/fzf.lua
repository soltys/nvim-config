local function toggle_xaml_filetype(_, opts)
  local fzf = require("fzf-lua")
  local actions = fzf.actions
  local flag = opts.toggle_xaml_filetype_flag or "--type-add xaml:*.xaml -t xaml"
  actions.toggle_flag(_, vim.tbl_extend("force", opts, { toggle_flag = flag }))
end

local function toggle_csharp_filetype(_, opts)
  local fzf = require("fzf-lua")
  local actions = fzf.actions
  local flag = opts.toggle_csharp_filetype_flag or "-t csharp"
  actions.toggle_flag(_, vim.tbl_extend("force", opts, { toggle_flag = flag }))
end

return {
  {
    "ibhagwan/fzf-lua",
    enabled = false,
    opts = function(_, opts)
      opts.grep.actions["alt-x"] = toggle_xaml_filetype
      opts.grep.actions["alt-s"] = toggle_csharp_filetype
    end,
  },
}
