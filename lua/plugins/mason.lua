return {
    "williamboman/mason.nvim",
    opts = {
        registries = {
            "github:mason-org/mason-registry",
            "github:crashdummyy/mason-registry",
        },
        ensure_installed = {
            "stylua",
            "shfmt",
            "roslyn",
            "lua-language-server",
            "powershell-editor-services",
            "rust-analyzer",
        },
    },
}
