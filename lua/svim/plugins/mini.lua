--  https://github.com/nvim-mini/mini.nvim

local utils = require("svim.utils")
local lib = require("svim.lib")
local setups = {
    ai = function()
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
                    {
                        "%u[%l%d]+%f[^%l%d]",
                        "%f[%S][%l%d]+%f[^%l%d]",
                        "%f[%P][%l%d]+%f[^%l%d]",
                        "^[%l%d]+%f[^%l%d]",
                    },
                    "^().*()$",
                },
                g = utils.mini.ai.buffer, -- buffer
                u = ai.gen_spec.function_call(), -- u for "Usage"
                U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
            },
        }
        ai.setup(ai_opts)

        lib.on_load("which-key", function()
            utils.mini.ai.which_key(ai_opts)
        end)
    end,
    surround = function()
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

        lib.on_load("which-key", function()
            vim.schedule(function()
                require("which-key").add({
                    { "gs", desc = "mini.surround", icon = "󰅲" },
                })
            end)
        end)
    end,
    pairs = function()
        require("mini.pairs").setup({
            modes = { insert = true, command = true, terminal = false },
            -- skip autopair when next character is one of these
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            -- skip autopair when the cursor is inside these treesitter nodes
            skip_ts = { "string" },
            -- skip autopair when next character is closing pair
            -- and there are more closing pairs than opening pairs
            skip_unbalanced = true,
            -- better deal with markdown code blocks
            markdown = true,
        })
    end,
    comment = function()
        require("mini.comment").setup({})
    end,
    operators = function()
        require("mini.operators").setup({})
    end,
    move = function()
        require("mini.move").setup({})
    end,
    splitjoin = function()
        require("mini.splitjoin").setup({
            mappings = {
                join = "<C-j>",
            },
        })
    end,
}
return {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
        for _, setup_action in pairs(setups) do
            setup_action()
        end
    end,
}
