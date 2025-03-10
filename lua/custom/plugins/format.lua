return {
    {
        "stevearc/conform.nvim",
        cmd = { "ConformInfo" },
        opts = {
            default_format_opts = {
                lsp_format = "fallback",
            },

            formatters_by_ft = {
                lua = { "stylua" },
            },
        },
    },
}
