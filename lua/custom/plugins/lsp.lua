return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Autocompletion
            "saghen/blink.cmp",
        },
        config = function()
            require("custom.lsp")
        end,
    },
}
