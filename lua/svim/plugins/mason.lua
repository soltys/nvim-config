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
            local mason = require("mason")
            mason.setup(opts)
            local my_lsp_config = require("svim.lsp")
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
                "vale",
            },
        },
    },
}
