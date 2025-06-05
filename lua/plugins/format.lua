return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        cmd = "ConformInfo",
        config = function()
            local conform = require("conform")
            conform.setup({
                default_format_opts = {
                    lsp_format = "fallback",
                },
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "isort", "black" },
                },
            })
        end,
    },
}
