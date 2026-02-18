return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            extensions = { "lazy", "oil", "mason" },
            options = {
                icons_enabled = true,
                theme = "catppuccin",
            },
            tabline = {
                lualine_a = {
                    {
                        "buffers",
                        filetype_names = {
                            snacks_picker_input = "Picker",
                            snacks_picker_list = "File List",
                        },
                        max_length = vim.o.columns * 2 / 2,
                    },
                },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = { "diagnostics" },
                lualine_z = {},
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    function()
                        -- worktrees has .git file instead of .git directory
                        local gitFile = vim.fn.findfile(".git", vim.fn.getcwd() .. ";")
                        local gitDirectory = vim.fn.finddir(".git", vim.fn.getcwd() .. ";")
                        if gitFile then
                            return vim.fn.fnamemodify(gitFile or gitDirectory, ":p:h:t")
                        end
                        if gitDirectory then
                            return vim.fn.fnamemodify(gitFile or gitDirectory, ":p:h:h:t")
                        end
                        return nil
                    end,
                },
                lualine_c = { { "filename", path = 2 } },
                lualine_x = { { "encoding", show_bomb = true }, "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        },
    },
    { -- Useful plugin to show you pending keybinds.
        "folke/which-key.nvim",
        event = "VimEnter", -- Sets the loading event to 'VimEnter'
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
        config = function()
            local wk = require("which-key")
            local opts = {
                -- delay between pressing a key and opening which-key (milliseconds)
                -- this setting is independent of vim.o.timeoutlen
                delay = 0,
                icons = {
                    -- set icon mappings to true if you have a Nerd Font
                    mappings = vim.g.have_nerd_font,
                    -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
                    -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
                    keys = vim.g.have_nerd_font and {} or {
                        Up = "<Up> ",
                        Down = "<Down> ",
                        Left = "<Left> ",
                        Right = "<Right> ",
                        C = "<C-…> ",
                        M = "<M-…> ",
                        D = "<D-…> ",
                        S = "<S-…> ",
                        CR = "<CR> ",
                        Esc = "<Esc> ",
                        ScrollWheelDown = "<ScrollWheelDown> ",
                        ScrollWheelUp = "<ScrollWheelUp> ",
                        NL = "<NL> ",
                        BS = "<BS> ",
                        Space = "<Space> ",
                        Tab = "<Tab> ",
                        F1 = "<F1>",
                        F2 = "<F2>",
                        F3 = "<F3>",
                        F4 = "<F4>",
                        F5 = "<F5>",
                        F6 = "<F6>",
                        F7 = "<F7>",
                        F8 = "<F8>",
                        F9 = "<F9>",
                        F10 = "<F10>",
                        F11 = "<F11>",
                        F12 = "<F12>",
                    },
                },
            }
            wk.setup(opts)
            wk.add({
                { "<leader>s", group = "[s]earch", icon = "" },
                { "<leader>c", group = "[c]ode", icon = "" },
                { "<leader>f", group = "[f]iles", icon = "" },
                { "<leader>b", group = "[b]uffers", icon = "" },
            })
        end,
    },
}
