local os = require("os")
local math = require("math")
math.randomseed(os.time())
local headers = {
    [[
███████╗██╗   ██╗██╗███╗   ███╗
██╔════╝██║   ██║██║████╗ ████║
███████╗██║   ██║██║██╔████╔██║
╚════██║╚██╗ ██╔╝██║██║╚██╔╝██║
███████║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]],
    [[
  ██████ ██▒   █▓ ██▓ ███▄ ▄███▓
▒██    ▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
░ ▓██▄   ▓██  █▒░▒██▒▓██    ▓██░
  ▒   ██▒ ▒██ █░░░██░▒██    ▒██
▒██████▒▒  ▒▀█░  ░██░▒██▒   ░██▒
▒ ▒▓▒ ▒ ░  ░ ▐░  ░▓  ░ ▒░   ░  ░
░ ░▒  ░ ░  ░ ░░   ▒ ░░  ░      ░
░  ░  ░      ░░   ▒ ░░      ░
      ░       ░   ░         ░
             ░
    ]],
    [[
  █████████  █████   █████ █████ ██████   ██████
 ███░░░░░███░░███   ░░███ ░░███ ░░██████ ██████
░███    ░░░  ░███    ░███  ░███  ░███░█████░███
░░█████████  ░███    ░███  ░███  ░███░░███ ░███
 ░░░░░░░░███ ░░███   ███   ░███  ░███ ░░░  ░███
 ███    ░███  ░░░█████░    ░███  ░███      ░███
░░█████████     ░░███      █████ █████     █████
 ░░░░░░░░░       ░░░      ░░░░░ ░░░░░     ░░░░░
]],
}
---@class snacks.dashboard.Config
local dashboard = {
    enabled = true,
    preset = {
        header = headers[math.random(1, #headers)],
        keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
                icon = " ",
                key = "c",
                desc = "Config",
                action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
    },
}
local keys = {
    -- stylua: ignore start
    { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
    { "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>.",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
    { "<leader>e",       function() Snacks.explorer() end,                                       desc = "File Explorer" },
    -- files
    { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
    { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
    { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
    { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
    -- Grep
    { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
    { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
    { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>sx",      function() Snacks.picker.grep_xaml() end,                               desc = "Grep in xaml files" },
    -- search
    { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
    { '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
    { "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
    { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
    { "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
    { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
    { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
    { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
    { "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
    { "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
    { "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
    { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
    { "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
    { "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
    { "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
    { "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
    { "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
    { "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
    { "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
    { "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
    -- LSP
    { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
    { "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
    -- Other
    { "<leader>n",       function() Snacks.notifier.show_history() end,                          desc = "Notification History" },
    { "<leader>bd",      function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
    { "<leader>cR",      function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
    { "<leader>un",      function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
    { "]]",              function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",           mode = { "n", "t" } },
    { "[[",              function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",           mode = { "n", "t" } },
    { "<leader>G",       function() Snacks.lazygit() end,                                        desc = "Run LazyGit" },
    -- stylua: ignore end
}
return {
    "folke/snacks.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    priority = 1000,
    lazy = false,
    ---@type snacks.plugins.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        image = { enabled = true },
        bigfile = { enabled = false },
        dashboard = dashboard,
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        picker = {
            enabled = true,
            sources = {
                explorer = {
                    hidden = true,
                    exclude = { ".git" },
                },
                ---@type snacks.picker.grep.Config
                grep_xaml = {
                    finder = "grep",
                    format = "file",
                    live = true, -- live grep by default
                    ft = "xaml",
                    supports_live = true,
                    show_empty = true,
                },
            },
        },
        notifier = { enabled = true, timeout = 3000 },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        scratch = { enabled = false },
    },
    keys = keys,
}
