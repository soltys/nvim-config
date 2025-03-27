return {
    {
        "nvzone/typr",
        dependencies = "nvzone/volt",
        opts = {},
        cmd = { "Typr", "TyprStats" },
        keys = {
            { "<leader>kt", "<cmd>Typr<cr>", desc = "Typer" },
            { "<leader>ks", "<cmd>TyprStats<cr>", desc = "Stats" },
        },
    },
}
