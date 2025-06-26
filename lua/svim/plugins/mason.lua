return {
    {
        "mason-org/mason.nvim",
        opts = {
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            },
        },
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
        event = "VeryLazy",
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
            },
        },
    },
}
