local M = {}

---@param increment boolean
---@param g? boolean
function M.dial(increment, g)
    local mode = vim.fn.mode(true)
    -- Use visual commands for VISUAL 'v', VISUAL LINE 'V' and VISUAL BLOCK '\22'
    local is_visual = mode == "v" or mode == "V" or mode == "\22"
    local func = (increment and "inc" or "dec") .. (g and "_g" or "_") .. (is_visual and "visual" or "normal")
    local group = vim.g.dials_by_ft[vim.bo.filetype] or "default"
    return require("dial.map")[func](group)
end

return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    },
    {
        "folke/flash.nvim",
        vscode = true,
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            {
                "R",
                mode = { "o", "x" },
                function() require("flash").treesitter_search() end,
                desc = "Treesitter Search",
            },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
            {
                "<Tab>",
                mode = { "n", "o", "v" },
                function() require("flash").treesitter({ actions = { ["<Tab>"] = "next", ["<S-Tab>"] = "prev" } }) end,
                desc = "Treesitter selection",
            },
            {
                "gl",
                mode = { "n" },
                function()
                    require("flash").jump({
                        search = { mode = "search", max_length = 0 },
                        label = { after = { 0, 0 } },
                        pattern = "^",
                    })
                end,
                desc = "Flash jump to line",
            },
        },
    },
    {
        "monaqa/dial.nvim",
        recommended = true,
        desc = "Increment and decrement numbers, dates, and more",
        -- stylua: ignore start
        keys = {
            { "<C-a>",  function() return M.dial(true) end,        expr = true, desc = "Increment", mode = { "n", "v" } },
            { "<C-x>",  function() return M.dial(false) end,       expr = true, desc = "Decrement", mode = { "n", "v" } },
            { "g<C-a>", function() return M.dial(true, true) end,  expr = true, desc = "Increment", mode = { "n", "v" } },
            { "g<C-x>", function() return M.dial(false, true) end, expr = true, desc = "Decrement", mode = { "n", "v" } },
        },
        -- stylua: ignore end
        opts = function()
            local augend = require("dial.augend")

            local logical_alias = augend.constant.new({
                elements = { "&&", "||" },
                word = false,
                cyclic = true,
            })

            local logical_operators = augend.constant.new({
                elements = { "==", "!=" },
                word = false,
                cyclic = true,
            })

            local ordinal_numbers = augend.constant.new({
                -- elements through which we cycle. When we increment, we go down
                -- On decrement we go up
                elements = {
                    "first",
                    "second",
                    "third",
                    "fourth",
                    "fifth",
                    "sixth",
                    "seventh",
                    "eighth",
                    "ninth",
                    "tenth",
                },
                -- if true, it only matches strings with word boundary. firstDate wouldn't work for example
                word = false,
                -- do we cycle back and forth (tenth to first on increment, first to tenth on decrement).
                -- Otherwise nothing will happen when there are no further values
                cyclic = true,
            })

            local weekdays = augend.constant.new({
                elements = {
                    "Monday",
                    "Tuesday",
                    "Wednesday",
                    "Thursday",
                    "Friday",
                    "Saturday",
                    "Sunday",
                },
                word = true,
                cyclic = true,
            })

            local months = augend.constant.new({
                elements = {
                    "January",
                    "February",
                    "March",
                    "April",
                    "May",
                    "June",
                    "July",
                    "August",
                    "September",
                    "October",
                    "November",
                    "December",
                },
                word = true,
                cyclic = true,
            })

            local capitalized_boolean = augend.constant.new({
                elements = {
                    "True",
                    "False",
                },
                word = true,
                cyclic = true,
            })

            return {
                dials_by_ft = {
                    json = "json",
                    lua = "lua",
                    markdown = "markdown",
                    xml = "xml",
                },
                groups = {
                    default = {
                        augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
                        augend.integer.alias.decimal_int, -- nonnegative and negative decimal number
                        augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
                        augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
                        ordinal_numbers,
                        weekdays,
                        months,
                        capitalized_boolean,
                        augend.constant.alias.bool, -- boolean value (true <-> false)
                        logical_alias,
                        logical_operators, -- == <-> !=
                    },
                    markdown = {
                        augend.constant.new({
                            elements = { "[ ]", "[x]" },
                            word = false,
                            cyclic = true,
                        }),
                        augend.misc.alias.markdown_header,
                    },
                    json = {
                        augend.semver.alias.semver, -- versioning (v1.1.2)
                    },
                    lua = {
                        augend.constant.new({
                            elements = { "and", "or" },
                            word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
                            cyclic = true, -- "or" is incremented into "and".
                        }),
                    },
                    xml = {
                        augend.constant.new({
                            elements = {
                                "ALL",
                                "INFO",
                                "DEBUG",
                                "ERROR",
                                "FATAL",
                            },
                            word = true,
                            cyclic = true,
                        }),
                    },
                },
            }
        end,
        config = function(_, opts)
            -- copy defaults to each group
            for name, group in pairs(opts.groups) do
                if name ~= "default" then vim.list_extend(group, opts.groups.default) end
            end
            require("dial.config").augends:register_group(opts.groups)
            vim.g.dials_by_ft = opts.dials_by_ft
        end,
    },
}
