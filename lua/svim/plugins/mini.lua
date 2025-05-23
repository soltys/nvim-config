--  https://github.com/echasnovski/mini.nvim

local utils = require("svim.utils")
local lib = require("svim.lib")

return {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
        -- Better Around/Inside textobjects
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
        --  - ci'  - [C]hange [I]nside [']quote
        local ai = require("mini.ai")
        local ai_opts = {
            n_lines = 500,
            custom_textobjects = {
                o = ai.gen_spec.treesitter({ -- code block
                    a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                    i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                }),
                f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
                c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
                t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
                d = { "%f[%d]%d+" }, -- digits
                e = { -- Word with case
                    { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
                    "^().*()$",
                },
                g = utils.mini.ai.buffer, -- buffer
                u = ai.gen_spec.function_call(), -- u for "Usage"
                U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
            },
        }
        ai.setup(ai_opts)

        lib.on_load("which_key", function()
            vim.schedule(function()
                utils.mini.ai.which_key(ai_opts)
            end)
        end)

        require("mini.surround").setup({
            mappings = {
                add = "gsa", -- Add surrounding in Normal and Visual modes
                delete = "gsd", -- Delete surrounding
                find = "gsf", -- Find surrounding (to the right)
                find_left = "gsF", -- Find surrounding (to the left)
                highlight = "gsh", -- Highlight surrounding
                replace = "gsr", -- Replace surrounding
                update_n_lines = "gsn", -- Update `n_lines`
            },
        })
    end,
}
