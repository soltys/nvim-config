return {
    {
        "mason-org/mason.nvim",
        opts = {
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            },
        },
        config = function(_, opts)
            require("mason").setup(opts)
            require("svim.lsp").setup()
        end,
    },
    {
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        "mason-org/mason-lspconfig.nvim",
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },
        opts = {
            ensure_installed = {
                "stylua",
                "roslyn",
                "lua_ls",
                "clangd",
                "powershell_es",
                "gopls",
                "markdownlint-cli2",
                "clang-format",
                "gersemi",
            },
        },
    },
    {
        "seblyng/roslyn.nvim",
        ft = "cs",
        dependencies = {
            "mason-org/mason.nvim",
        },
        ---@module 'roslyn.config'
        ---@type RoslynNvimConfig
        opts = {
            -- ignores all targets, forces to manually choose target, stops auto launching roslnyn
            ignore_target = function(_) return true end,
        },
    },
    {
        "folke/lazydev.nvim",
        dependencies = { { "DrKJeff16/wezterm-types", lazy = true } },
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "snacks.nvim", words = { "Snacks" } },
                { path = "wezterm-types", modes = { "wezterm" } },
            },
        },
    },
}
